.. _backbone-label:

Chromap
==============================

Introduction
~~~~~~~~
Chromap is an ultrafast method for aligning and preprocessing high throughput chromatin profiles.
| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/chromap 
| Home page: https://github.com/haowenz/chromap

Versions
~~~~~~~~
- 0.2.2

Commands
~~~~~~~
- chromap

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load chromap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run chromap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=chromap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers chromap
