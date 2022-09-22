.. _backbone-label:

Liftoff
==============================

Introduction
~~~~~~~~
``Liftoff`` is an accurate GFF3/GTF lift over pipeline. For more information, please check its website: https://biocontainers.pro/tools/liftoff and its home page on `Github`_.

Versions
~~~~~~~~
- 1.6.3

Commands
~~~~~~~
- liftoff
- python
- python3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load liftoff

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Liftoff on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=liftoff
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers liftoff

    liftoff -g reference.gff3 -o target.gff3 \
        -chroms chr_pairs.txt target.fasta reference.fa

.. _Github: https://github.com/agshumate/Liftoff
