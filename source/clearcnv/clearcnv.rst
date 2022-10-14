.. _backbone-label:

Clearcnv
==============================

Introduction
~~~~~~~~
ClearCNV: CNV calling from NGS panel data in the presence of ambiguity and noise.

| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/clearcnv 
| Home page: https://github.com/bihealth/clear-cnv

Versions
~~~~~~~~
- 0.306

Commands
~~~~~~~
- clearCNV

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load clearcnv

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run clearcnv on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=clearcnv
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers clearcnv
