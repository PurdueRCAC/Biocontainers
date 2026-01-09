.. _backbone-label:

Rush
==============================

Introduction
~~~~~~~~
rush is a tool similar to GNU parallel and gargs. rush borrows some idea from them and has some unique features, e.g., supporting custom defined variables, resuming multi-line commands, more advanced embeded replacement strings.


| For more information, please check:
| Home page: https://github.com/shenwei356/rush

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.4.2

Commands
~~~~~~~
- rush

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load rush

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rush on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=rush
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rush

