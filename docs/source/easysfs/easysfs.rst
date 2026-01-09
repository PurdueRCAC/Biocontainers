.. _backbone-label:

Easysfs
==============================

Introduction
~~~~~~~~
easySFS is a tool for the effective selection of population size projection for construction of the site frequency spectrum.


| For more information, please check:
| Home page: https://github.com/isaacovercast/easySFS

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.0

Commands
~~~~~~~
- easySFS.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load easysfs

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run easysfs on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=easysfs
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers easysfs

