.. _backbone-label:

Mothur
==============================

Introduction
~~~~~~~~
Mothur is an open source software package for bioinformatics data processing.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/mothur 
| Home page: https://mothur.org

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.46.0
- 1.47.0
- 1.48.0

Commands
~~~~~~~
- mothur

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load mothur

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run mothur on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mothur
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mothur

