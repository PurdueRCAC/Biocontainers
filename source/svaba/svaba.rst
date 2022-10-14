.. _backbone-label:

Svaba
==============================

Introduction
~~~~~~~~
SvABA is a method for detecting structural variants in sequencing data using genome-wide local assembly.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/svaba 
| Home page: https://github.com/walaj/svaba

Versions
~~~~~~~~
- 1.1.0

Commands
~~~~~~~
- svaba

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load svaba

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run svaba on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=svaba
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers svaba

    DBSNP=dbsnp_indel.vcf
    TUM_BAM=G15512.HCC1954.1.COST16011_region.bam
    NORM_BAM=HCC1954.NORMAL.30x.compare.COST16011_region.bam
    CORES=8 ## set any number of cores
    REF=Homo_sapiens_assembly19.COST16011_region.fa
    svaba run -t $TUM_BAM -n $NORM_BAM \
        -p $CORES -D $DBSNP \
        -a somatic_run -G $REF
