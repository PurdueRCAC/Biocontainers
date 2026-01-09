.. _backbone-label:

Fragpipe
==============================

Introduction
~~~~~~~~
FragPipe is a comprehensive computational platform for analyzing mass spectrometry-based proteomics data


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/fragpipe 
| Home page: https://github.com/Nesvilab/FragPipe

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 22.0

Commands
~~~~~~~
- fragpipe

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load fragpipe

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run fragpipe on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fragpipe
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fragpipe

