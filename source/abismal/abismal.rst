.. _backbone-label:

Abismal
==============================

Introduction
~~~~~~~~
Another Bisulfite Mapping Algorithm (abismal) is a read mapping program for bisulfite sequencing in DNA methylation studies.
For more information, please check:
BioContainers: https://biocontainers.pro/tools/abismal 
Home page: https://github.com/smithlabcode/abismal

Versions
~~~~~~~~
- 3.0.0

Commands
~~~~~~~
- abismal
- abismalidx
- simreads

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load abismal

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run abismal on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=abismal
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers abismal
<<<<<<< HEAD

=======
>>>>>>> c6da941f688db250c92ddde17bb514a3508297a7
