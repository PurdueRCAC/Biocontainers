.. _backbone-label:

Picard
==============================

Introduction
~~~~~~~~
Picard is a set of command line tools for manipulating high-throughput sequencing (HTS) data and formats such as SAM/BAM/CRAM and VCF.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/picard 
| Home page: https://broadinstitute.github.io/picard/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.25.1
- 2.26.10

Commands
~~~~~~~
- picard

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load picard

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run picard on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=picard
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers picard

