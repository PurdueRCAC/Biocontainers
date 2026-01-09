.. _backbone-label:

Csvtk
==============================

Introduction
~~~~~~~~
Csvtk is a cross-platform, efficient and practical CSV/TSV toolkit.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/csvtk 
| Home page: https://github.com/shenwei356/csvtk

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.23.0
- 0.25.0

Commands
~~~~~~~
- csvtk

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load csvtk

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run csvtk on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=csvtk
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers csvtk

