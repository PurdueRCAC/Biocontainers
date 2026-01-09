.. _backbone-label:

Phrap
==============================

Introduction
~~~~~~~~
phrap is a program for assembling shotgun DNA sequence data.


| For more information, please check:
| Home page: http://www.phrap.org/phredphrapconsed.html#block_phrap

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.090518

Commands
~~~~~~~
- phrap

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load phrap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run phrap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=phrap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers phrap

