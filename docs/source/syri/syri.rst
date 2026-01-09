.. _backbone-label:

Syri
==============================

Introduction
~~~~~~~~
Syri compares alignments between two chromosome-level assemblies and identifies synteny and structural rearrangements.


| For more information, please check:
| Home page: https://github.com/schneebergerlab/syri

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.6

Commands
~~~~~~~
- syri

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load syri

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run syri on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=syri
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers syri

