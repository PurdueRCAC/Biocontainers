.. _backbone-label:

Meryl
==============================

Introduction
~~~~~~~~
``Meryl`` is a genomic k-mer counter (and sequence utility) with nice features. 
| For more information, please check its website: https://biocontainers.pro/tools/meryl and its home page on `Github`_.

Versions
~~~~~~~~
- 1.3

Commands
~~~~~~~
- meryl
- meryl-analyze
- meryl-import
- meryl-lookup
- meryl-simple

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load meryl

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Meryl on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=meryl
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers meryl

    meryl count k=42 data/ec.fna.gz output ec.meryl

.. _Github: https://github.com/marbl/meryl
