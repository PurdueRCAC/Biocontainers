.. _backbone-label:

Pycoqc
==============================

Introduction
~~~~~~~~
Pycoqc is a tool that computes metrics and generates interactive QC plots for Oxford Nanopore technologies sequencing data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/pycoqc 
| Home page: https://github.com/a-slide/pycoQC

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.5.2

Commands
~~~~~~~
- pycoQC
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pycoqc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pycoqc on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pycoqc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pycoqc

