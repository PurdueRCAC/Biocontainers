.. _backbone-label:

Mmseqs2
==============================

Introduction
~~~~~~~~
Mmseqs2 is a software suite to search and cluster huge protein and nucleotide sequence sets.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/mmseqs2 
| Home page: https://github.com/soedinglab/MMseqs2

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 13.45111
- 14.7e284

Commands
~~~~~~~
- mmseqs

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load mmseqs2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run mmseqs2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mmseqs2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mmseqs2

