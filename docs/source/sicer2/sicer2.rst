.. _backbone-label:

Sicer2
==============================

Introduction
~~~~~~~~
Sicer2 is the redesigned and improved ChIP-seq broad peak calling tool SICER.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/abralab/sicer 
| Home page: https://github.com/zanglab/SICER2

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.0.3
- 1.2.0

Commands
~~~~~~~
- sicer
- sicer_df
- recognicer
- recognicer_df

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load sicer2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run sicer2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=sicer2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers sicer2

