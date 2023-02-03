"""R-Base 4.1.1 + RStudio (Debian testing+unstable)

Created with HPC Container Maker by Lev Gorenstein <lev@purdue.edu>, 2022-02-11

To rebuild: use the build shell script :).  Or:
    $ hpccm --recipe this_recipe.py  --userarg VER=<VERSION> \\
            --format singularity  --singularity-version 3.6 > Singularity.def
    $ sudo singularity build container.sif Singularity.def

To use, can do either of:
    singularity exec  container.sif  rstudio   # Or R, or Rscript
    singularity run   container.sif  rstudio   # Or R, or Rscript
or even just call "container.sif" from your shell (yes, it is executable
and set to run RStudio by default).

A caveat for running X11 GUI programs under Thinlinc: Thinlinc keeps
sessions information in /var/opt/thinlinc.  But RCAC does not export this
path into containers, so under Thinlinc the GUI fails. To mitigate,
bind the path from command line with '-B' flag:
    singularity exec  -B /var/opt,/run/user  container.sif  program
Note that you can not pass the -B flag if executing container.sif directly
(as in './container.sif') - needs to be on the singularity command line.
Easy to do with a simple wrapper script or via $SINGULARITY_BIND variable.

Another caveat for Rstudio: needs '-B /usr/share/fonts' to find system
fonts (otherwise terminal panel is garbled).
"""

# Define couple variables and provide reasonable default for version
APP="r-base"
VER=USERARG.get('VER', '4.1.1')
PKG='{0}-{1}'.format(APP, VER)
rstVER='2021.09.2-382'
import os
import sys

# Base image.
APP_TAGGED='{0}:{1}'.format(APP, VER)
Stage0 += comment(__doc__.strip(), reformat=False)
Stage0 += baseimage(image=APP_TAGGED, _bootstrap='docker', _docker_env=False)

# Metadata
Stage0 += label(metadata={'App':     "R with Rstudio",
                          'Version': VER,
                          'URL':     "https://www.r-project.org/, https://www.rstudio.com/products/rstudio/",
                          'BaseImg': "Debian Testing",
                          'Created': "Lev Gorenstein <lev@purdue.edu>",
                         })

# RCAC-specific tweaks
Stage0 += comment("Pre-make RCAC-specific directories")
Stage0 += comment("/var/opt and /run/user are needed for Thinlinc.", reformat=False)
Stage0 += shell(commands=['mkdir -p /home /apps /scratch /depot',
                          'mkdir -p /var/opt /run/user'
                         ])

# LG: Problem discovered 2023-02-02 while trying to rebuild the container.
# Apparently 'testing' drifts a lot in a year, so now we get a:
#   libc6-dev : Breaks: binutils (< 2.38) but 2.37-7 is to be installed
# error.  In the future, maybe we should base our work on the 'rockr' series
# (Debian Stable) as opposed to 'r-base' (Debian Testing+Unstable) - see
# https://github.com/rocker-org/rocker/issues/167#issuecomment-439985251 and
# https://doi.org/10.32614/RJ-2017-065 for detailed discussion.
# Workaround solution: update 'binutils' in-place.

# Before we begin, need to upgrade existing binutils that conflicts with libc6.
Stage0 += comment("2023-02-02: Old existing binutils package gets in the way of libc6.  Update binutils first.")
Stage0 += shell(commands=['apt-get -y update',
                          'apt-get -y --only-upgrade install binutils',
                         ])


# And go!
# NetCDF, HDF5 and V8 development libraries are of interest to Statistics users.
# And a few dependencies for RStudio.
EXTRAS = ['libcurl4-openssl-dev', 'libssl-dev', 'libxml2-dev',
           'libcairo2-dev', 'libxt-dev', 'libgsl-dev',
           'libnetcdf-dev', 'libhdf5-dev', 'libv8-dev',
           'cmake']
# Use of binary-only (not -dev) versions of the RStudio shared libraries
# prerequisites can shave a few MB (out of 700MB) from the final image.
# EXTRAS += ['libedit2', 'libclang-dev', 'libxkbcommon-x11-0',
#            'libpq5', 'libgl1', 'libdbus-1-3', 'libnss3',
#            'libxcomposite1', 'libxcursor1', 'libxdamage1',
#            'libxi6', 'libxtst6', 'libasound2',
#           ]
EXTRAS += ['libedit2', 'libclang-dev', 'libxkbcommon-x11-dev',
           'libpq5', 'libgl-dev', 'libdbus-1-dev', 'libnss3',
           'libxcomposite-dev', 'libxcursor-dev', 'libxdamage-dev',
           'libxi-dev', 'libxtst-dev', 'libasound-dev',
          ]
Stage0 += comment("{0} is alredy in the image. Install necessary additional packages".format(PKG))
Stage0 += packages(apt=EXTRAS)

# And install Rstudio by hand.
# Tricky: do not use /tmp or /var/tmp (does not work in Singularity for
# auto-bound directories (why?)). Temp. drop into /usr/local or something.
rstPKG = 'rstudio-{0}-amd64.deb'.format(rstVER)
tmpdir = '/opt'
Stage0 += comment("Install {0} package".format(rstPKG))
Stage0 += copy(src=[rstPKG], dest=tmpdir)
Stage0 += shell(commands=[
                          'dpkg -i {0}/{1}'.format(tmpdir, rstPKG),
                          'rm -f {0}/{1}'.format(tmpdir, rstPKG),
                         ])


# Environment
Stage0 += comment("Ignore ~/.local/lib/pythonX.Y/site-packages inside the container.")
Stage0 += environment(variables={
                           'PYTHONNOUSERSITE': '1',
                           })

Stage0 += comment("This is needed after Debian testing moved from glibc 2.33-5 to 2.36-8... this setting is not desireable, but container shows blank screen without it :(")
Stage0 += environment(variables={
                           'RSTUDIO_CHROMIUM_ARGUMENTS': '--no-sandbox',
                           })

# Runscript
Stage0 += comment("Define runscript (what would the container run?)")
Stage0 += runscript(commands=[
                              'default="rstudio"',
                              'echo "Arguments received: $*"',
                              '# If $1 is a command, try executing it,',
                              '# otherwise consider everything as arguments for the default tool.',
                              'if command -v "$1" > /dev/null 2>&1; then',
                              '    exec "$@"',
                              'else',
                              '    exec $default "$@"',
                              'fi',
                             ],
                   _exec=False)


# Install SCI-F and add each program as a SCI-F application
# https://github.com/NVIDIA/hpc-container-maker/blob/master/recipes/examples/scif.py
Stage0 += comment("And define applications in this image (opional but neat for 'run --app XXX').  See list with 'singularity inspect --list-apps image.sif' (there used to be a 'singularity apps' command for that, but it is no longer in 3.*).")
Stage0 += pip(packages=['scif'], pip='pip3')

descr = {
         'rstudio':     'Invokes a GUI development environment (IDE) for R',
         'R':           'Invokes the main R program',
         'Rscript':     'Invokes the Rscript program',
}

for exe in descr.keys():
    Stage0 += comment("{0}\n{1}\n{0}".format("=======================", exe), reformat=False)
    scifapps = scif(name=exe)
    scifapps += comment("    {}".format(descr[exe]))
    scifapps += runscript(commands=['{} "$@"'.format(exe)])

    Stage0 += scifapps

