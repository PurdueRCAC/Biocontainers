.. _backbone-label:

Pygenometracks
==============================

Introduction
~~~~~~~~
pyGenomeTracks aims to produce high-quality genome browser tracks that are highly customizable.

| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/pygenometracks 
| Home page: https://github.com/deeptools/pyGenomeTracks

Versions
~~~~~~~~
- 3.7

Commands
~~~~~~~
- make_tracks_file
- pyGenomeTracks

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pygenometracks

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pygenometracks on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pygenometracks
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pygenometracks

    make_tracks_file --trackFiles domains.bed bigwig.bw -o tracks.ini

    pyGenomeTracks --tracks tracks.ini \
       --region chr2:10,000,000-11,000,000 --outFileName nice_image.pdf
