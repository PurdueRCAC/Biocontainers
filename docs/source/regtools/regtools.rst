.. _backbone-label:

Regtools
==============================

Introduction
~~~~~~~~
Regtools are tools that integrate DNA-seq and RNA-seq data to help interpret mutations in a regulatory and splicing context.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/griffithlab/regtools/ 
| Home page: https://github.com/griffithlab/regtools

Versions
~~~~~~~~
- 1.0.0

Commands
~~~~~~~
- regtools

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load regtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run regtools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=regtools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers regtools
