.. _backbone-label:

Sicer
==============================

Introduction
~~~~~~~~
Sicer is a clustering approach for identification of enriched domains from histone modification ChIP-Seq data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/sicer 
| Home page: http://home.gwu.edu/~wpeng/Software.htm

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.1

Commands
~~~~~~~
- SICER-df-rb.sh
- SICER-df.sh
- SICER-rb.sh
- SICER.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load sicer

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run sicer on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=sicer
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers sicer

