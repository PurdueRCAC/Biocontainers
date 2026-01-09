.. _backbone-label:

Celltypist
==============================

Introduction
~~~~~~~~
Celltypist is a tool for semi-automatic cell type annotation.


| For more information, please check:
| Home page: https://github.com/Teichlab/celltypist

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.2.0
- 1.1.0

Commands
~~~~~~~
- celltypist
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load celltypist

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run celltypist on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=celltypist
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers celltypist

