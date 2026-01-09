.. _backbone-label:

Svtools
==============================

Introduction
~~~~~~~~
Svtools is a suite of utilities designed to help bioinformaticians construct and explore cohort-level structural variation calls.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/halllab/svtools 
| Home page: https://github.com/hall-lab/svtools

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.5.1

Commands
~~~~~~~
- svtools

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load svtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run svtools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=svtools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers svtools

