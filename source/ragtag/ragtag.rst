.. _backbone-label:

Ragtag
==============================

Introduction
~~~~~~~~
``Ragtag`` is a tool for fast reference-guided genome assembly scaffolding. For more information, please check its website: https://biocontainers.pro/tools/ragtag and its home page on `Github`_.

Versions
~~~~~~~~
- 2.1.0

Commands
~~~~~~~
- ragtag.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load ragtag

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Ragtag on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ragtag
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ragtag

    ragtag.py correct ref.fasta query.fasta
    ragtag.py patch target.fa query.fa

.. _Github: https://github.com/malonge/RagTag
