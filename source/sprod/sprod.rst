.. _backbone-label:

Sprod
==============================

Introduction
~~~~~~~~
Sprod: De-noising Spatially Resolved Transcriptomics Data Based on Position and Image Information.
| For more information, please check:
| Home page: https://github.com/yunguan-wang/SPROD

Versions
~~~~~~~~
- 1.0

Commands
~~~~~~~
- python
- python3
- sprod.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load sprod

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run sprod on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=sprod
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers sprod
 
    python3 test_examples.py
