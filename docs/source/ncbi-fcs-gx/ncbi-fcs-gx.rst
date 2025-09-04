.. _backbone-label:

Ncbi-fcs-gx
==============================

Introduction
~~~~~~~~
FCS-GX detects contamination from foreign organisms in genome sequences. This tool is one module within the NCBI Foreign Contamination Screening (FCS) program suite.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/ncbi-fcs-gx 
| Home page: https://github.com/ncbi/fcs

Versions
~~~~~~~~
- 0.5.4

Commands
~~~~~~~
- gx
- run_gx.py
- action_report.py
- classify_taxonomy.py
- sync_files.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ncbi-fcs-gx

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ncbi-fcs-gx on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ncbi-fcs-gx
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ncbi-fcs-gx
