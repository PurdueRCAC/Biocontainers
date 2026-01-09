.. _backbone-label:

Mykrobe
==============================

Introduction
~~~~~~~~
Mykrobe analyses the whole genome of a bacterial sample, all within a couple of minutes, and predicts which drugs the infection is resistant to.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/mykrobe 
| Home page: https://github.com/Mykrobe-tools/mykrobe

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.11.0

Commands
~~~~~~~
- mykrobe

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load mykrobe

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run mykrobe on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mykrobe
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mykrobe

