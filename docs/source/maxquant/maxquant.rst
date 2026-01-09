.. _backbone-label:

Maxquant
==============================

Introduction
~~~~~~~~
Maxquant is a quantitative proteomics software package designed for analyzing large mass-spectrometric data sets. It is specifically aimed at high-resolution MS data.


| For more information, please check:
| Home page: https://www.maxquant.org

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.1.0.0
- 2.1.3.0
- 2.1.4.0
- 2.3.1.0

Commands
~~~~~~~
- MaxQuantGui.exe
- MaxQuantCmd.exe

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load maxquant

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run maxquant on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=maxquant
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers maxquant

