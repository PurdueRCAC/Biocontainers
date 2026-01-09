.. _backbone-label:

Samplot
==============================

Introduction
~~~~~~~~
Samplot is a command line tool for rapid, multi-sample structural variant visualization.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/samplot 
| Home page: https://github.com/ryanlayer/samplot

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.3.0

Commands
~~~~~~~
- samplot

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load samplot

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run samplot on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=samplot
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers samplot

