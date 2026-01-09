.. _backbone-label:

Deepbgc
==============================

Introduction
~~~~~~~~
Deepbgc is a tool for BGC detection and classification using deep learning.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/deepbgc 
| Home page: https://github.com/Merck/deepbgc

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.1.26
- 0.1.30

Commands
~~~~~~~
- deepbgc

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load deepbgc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run deepbgc on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=deepbgc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers deepbgc

