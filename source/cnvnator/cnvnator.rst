.. _backbone-label:

Cnvnator
==============================

Introduction
~~~~~~~~
``Cnvnator`` is a tool for discovery and characterization of copy number variation (CNV) in population genome sequencing data. For more information, please check its website: https://biocontainers.pro/tools/cnvnator and its home page on `Github`_.

Versions
~~~~~~~~
- 0.4.1

Commands
~~~~~~~
- cnvnator
- cnvnator2VCF.pl
- plotbaf.py
- plotcircular.py
- plotrdbaf.py
- pytools.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load cnvnator

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Cnvnator on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cnvnator
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cnvnator

    cnvnator -root file.root -tree file.bam -chrom $(seq 1 22) X Y

    plotcircular.py file.root

.. _Github: https://github.com/abyzovlab/CNVnator
