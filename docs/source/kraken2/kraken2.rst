.. _backbone-label:

Kraken2
==============================

Introduction
~~~~~~~~
Kraken2 is a taxonomic sequence classifier that assigns taxonomic labels to DNA sequences.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/kraken2 
| Home page: https://ccb.jhu.edu/software/kraken2/index.shtml

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.1.2
- 2.1.2_fixftp
- 2.1.3

Commands
~~~~~~~
- kraken2
- kraken2-build
- kraken2-inspect

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load kraken2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run kraken2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=kraken2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kraken2

