.. _backbone-label:

Gatk
==============================

Introduction
~~~~~~~~
GATK (Genome Analysis Toolkit) is a collection of command-line tools for analyzing high-throughput sequencing data with a primary focus on variant discovery.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gatk 
| Home page: https://www.broadinstitute.org/gatk/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 3.8

Commands
~~~~~~~
- gatk3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gatk

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gatk on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gatk
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gatk

