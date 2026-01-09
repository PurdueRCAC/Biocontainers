.. _backbone-label:

Alien-hunter
==============================

Introduction
~~~~~~~~
Alien-hunter is an application for the prediction of putative Horizontal Gene Transfer (HGT) events with the implementation of Interpolated Variable Order Motifs (IVOMs).


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/alien-hunter 
| Home page: https://www.sanger.ac.uk/tool/alien-hunter/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.7.7

Commands
~~~~~~~
- alien_hunter

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load alien-hunter

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run alien-hunter on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=alien-hunter
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers alien-hunter

