.. _backbone-label:

Isoseq3
==============================

Introduction
~~~~~~~~
``Isoseq3`` - Scalable De Novo Isoform Discovery. |For more information, please check its website: https://biocontainers.pro/tools/isoseq3 and its home page on `Github`_.

Versions
~~~~~~~~
- 3.4.0
- 3.7.0

Commands
~~~~~~~
- isoseq3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load isoseq3

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Isoseq3 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=isoseq3
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers isoseq3

    isoseq3 --version

    isoseq3 refine --require-polya \
        alz.demult.5p--3p.bam \
        primers.fasta alz.flnc.bam

    isoseq3 cluster alz.flnc.bam \
        alz.polished.bam --verbose --use-qvs

.. _Github: https://github.com/PacificBiosciences/IsoSeq
