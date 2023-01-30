.. _backbone-label:

Memes
==============================

Introduction
~~~~~~~~
memes is an R interface to the MEME Suite family of tools, which provides several utilities for performing motif analysis on DNA, RNA, and protein sequences. memes works by detecting a local install of the MEME suite, running the commands, then importing the results directly into R.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/snystrom/memes_docker 
| Home page: https://github.com/snystrom/memes

Versions
~~~~~~~~
- 1.1.2

Commands
~~~~~~~
- R

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load memes

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run memes on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=memes
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers memes
