.. _backbone-label:

Lima
==============================

Introduction
~~~~~~~~
Lima is the standard tool to identify barcode and primer sequences in PacBio single-molecule sequencing data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/lima 
| Home page: https://lima.how

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.2.0

Commands
~~~~~~~
- lima

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load lima

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run lima on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=lima
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers lima

