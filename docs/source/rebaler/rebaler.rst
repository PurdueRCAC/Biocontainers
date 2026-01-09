.. _backbone-label:

Rebaler
==============================

Introduction
~~~~~~~~
Rebaler is a program for conducting reference-based assemblies using long reads.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/rebaler 
| Home page: https://github.com/rrwick/Rebaler

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.2.0

Commands
~~~~~~~
- rebaler

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load rebaler

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rebaler on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=rebaler
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rebaler

