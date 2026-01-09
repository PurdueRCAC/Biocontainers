.. _backbone-label:

Rnapeg
==============================

Introduction
~~~~~~~~
RNApeg is an RNA junction calling, correction, and quality-control package.


| For more information, please check:
| Github package: https://github.com/stjude/RNApeg/pkgs/container/rnapeg 
| Home page: https://github.com/stjude/RNApeg

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.7.1

Commands
~~~~~~~
- RNApeg.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load rnapeg

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rnapeg on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=rnapeg
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rnapeg

