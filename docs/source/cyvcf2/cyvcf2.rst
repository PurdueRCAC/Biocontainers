.. _backbone-label:

Cyvcf2
==============================

Introduction
~~~~~~~~
Cyvcf2 is a cython wrapper around htslib built for fast parsing of Variant Call Format (VCF) files.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/cyvcf2 
| Home page: https://github.com/brentp/cyvcf2

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.30.14

Commands
~~~~~~~
- cyvcf2
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cyvcf2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cyvcf2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cyvcf2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cyvcf2

