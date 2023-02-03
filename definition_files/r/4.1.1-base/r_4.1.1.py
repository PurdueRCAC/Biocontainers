"""R-Base 4.1.1 (Debian testing+unstable)

Created with HPC Container Maker by Lev Gorenstein <lev@purdue.edu>, 2021-09-14

To rebuild: use the build shell script :).  Or:
    $ hpccm --recipe this_recipe.py  --userarg VER=<VERSION> \\
            --format singularity  --singularity-version 3.6 > Singularity.def
    $ sudo singularity build container.sif Singularity.def

To use, can do either of:
    singularity exec  container.sif  R      # Or Rscript
    singularity run   container.sif  R      # Or Rscript
or even just call "container.sif" from your shell (yes, it is executable
and set to run R by default).

A caveat for running X11 GUI programs under Thinlinc: Thinlinc keeps
sessions information in /var/opt/thinlinc.  But RCAC does not export this
path into containers, so under Thinlinc the GUI fails. To mitigate,
bind the path from command line with '-B' flag:
    singularity exec  -B /var/opt,/run/user  container.sif  program
Note that you can not pass the -B flag if executing container.sif directly
(as in './container.sif') - needs to be on the singularity command line.
Easy to do with a simple wrapper script or via $SINGULARITY_BIND variable.
"""

# Define couple variables and provide reasonable default for version
APP="r-base"
VER=USERARG.get('VER', '4.1.1')
PKG='{0}-{1}'.format(APP, VER)
import os
import sys

# Base image.
APP_TAGGED='{0}:{1}'.format(APP, VER)
Stage0 += comment(__doc__.strip(), reformat=False)
Stage0 += baseimage(image=APP_TAGGED, _bootstrap='docker', _docker_env=False)

# Metadata
Stage0 += label(metadata={'App':     "R",
                          'Version': VER,
                          'URL':     "https://www.r-project.org/",
                          'BaseImg': "Debian Testing",
                          'Created': "Lev Gorenstein <lev@purdue.edu>",
                         })

# RCAC-specific tweaks
Stage0 += comment("Pre-make RCAC-specific directories")
Stage0 += comment("/var/opt and /run/user are needed for Thinlinc.", reformat=False)
Stage0 += shell(commands=['mkdir -p /home /apps /scratch /depot',
                          'mkdir -p /var/opt /run/user'
                         ])

# And go!
# NetCDF, HDF5 and V8 development libraries are of interest to Statistics users.
EXTRAS=['libcurl4-openssl-dev', 'libssl-dev', 'libxml2-dev',
        'libcairo2-dev', 'libxt-dev', 'libgsl-dev',
        'libnetcdf-dev', 'libhdf5-dev', 'libv8-dev',
        'cmake']
Stage0 += comment("{0} is alredy in the image. Install necessary additional packages".format(PKG))
Stage0 += packages(apt=EXTRAS)

# Environment
Stage0 += comment("Ignore ~/.local/lib/pythonX.Y/site-packages inside the container.")
Stage0 += environment(variables={
                                'PYTHONNOUSERSITE': '1',
                                })

# Runscript
Stage0 += comment("Define runscript (what would the container run?)")
Stage0 += runscript(commands=[
                              'default="R"',
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
         'R':           'Invokes the main R program',
         'Rscript':     'Invokes the Rscript program'
}

for exe in descr.keys():
    Stage0 += comment("{0}\n{1}\n{0}".format("=======================", exe), reformat=False)
    scifapps = scif(name=exe)
    scifapps += comment("    {}".format(descr[exe]))
    scifapps += runscript(commands=['{} "$@"'.format(exe)])

    Stage0 += scifapps

