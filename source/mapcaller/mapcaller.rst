.. _backbone-label:

Mapcaller
==============================

Introduction
~~~~~~~~
``Mapcaller`` is an efficient and versatile approach for short-read mapping and variant identification using high-throughput sequenced data. |For more information, please check its website: https://biocontainers.pro/tools/mapcaller and its home page on `Github`_.

Versions
~~~~~~~~
- 0.9.9.41

Commands
~~~~~~~
- MapCaller

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load mapcaller

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Mapcaller on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=mapcaller
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mapcaller

    MapCaller index ref.fasta ref

    MapCaller -t 12 -i ref -f input_1.fastq  -f2 input_2.fastq  -vcf out.vcf
.. _Github: https://github.com/hsinnan75/MapCaller
