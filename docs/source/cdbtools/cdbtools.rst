.. _backbone-label:

Cdbtools
==============================

Introduction
~~~~~~~~
Cdbtools is a collection of tools used for creating indices for quick retrieval of any particular sequences from large multi-FASTA files.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/cdbtools 
| Home page: http://compbio.dfci.harvard.edu/tgi

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.99

Commands
~~~~~~~
- cdbfasta
- cdbyank

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cdbtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cdbtools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cdbtools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cdbtools

