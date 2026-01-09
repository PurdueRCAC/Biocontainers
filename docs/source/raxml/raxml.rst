.. _backbone-label:

Raxml
==============================

Introduction
~~~~~~~~
Raxml(Randomized Axelerated Maximum Likelihood) is a program for. Maximum Likelihood-based inference of large phylogenetic trees.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/raxml 
| Home page: https://cme.h-its.org/exelixis/web/software/raxml/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 8.2.12

Commands
~~~~~~~
- raxmlHPC
- raxmlHPC-AVX2
- raxmlHPC-PTHREADS
- raxmlHPC-PTHREADS-AVX2
- raxmlHPC-PTHREADS-SSE3
- raxmlHPC-SSE3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load raxml

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run raxml on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=raxml
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers raxml

