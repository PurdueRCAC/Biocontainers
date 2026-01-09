.. _backbone-label:

Ivar
==============================

Introduction
~~~~~~~~
Ivar is a computational package that contains functions broadly useful for viral amplicon-based sequencing.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/ivar 
| Home page: https://github.com/andersen-lab/ivar

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.3.1
- 1.4.2

Commands
~~~~~~~
- ivar

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ivar

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ivar on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ivar
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ivar

