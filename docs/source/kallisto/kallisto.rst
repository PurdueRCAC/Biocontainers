.. _backbone-label:

Kallisto
==============================

Introduction
~~~~~~~~
Kallisto is a program for quantifying abundances of transcripts from bulk and single-cell RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/kallisto 
| Home page: https://pachterlab.github.io/kallisto/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.46.2
- 0.48.0

Commands
~~~~~~~
- kallisto

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load kallisto

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run kallisto on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=kallisto
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kallisto

