.. _backbone-label:

Pasta
==============================

Introduction
~~~~~~~~
PASTA: Ultra-Large Multiple Sequence Alignment for Nucleotide and Amino-Acid Sequences.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/pasta 
| Home page: https://github.com/smirarab/pasta

Versions
~~~~~~~~
- 1.8.7

Commands
~~~~~~~
- run_pasta.py
- run_seqtools.py
- sumlabels.py
- sumtrees.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pasta

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pasta on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pasta
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pasta
