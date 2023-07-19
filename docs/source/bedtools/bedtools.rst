.. _backbone-label:

Bedtools
==============================

Introduction
~~~~~~~~
``Bedtools`` is an extensive suite of utilities for genome arithmetic and comparing genomic features in BED format. 

| For more information, please check its website: https://biocontainers.pro/tools/bedtools and its home page on `Github`_.

Versions
~~~~~~~~
- 2.30.0
- 2.31.0

Commands
~~~~~~~
- annotateBed
- bamToBed
- bamToFastq
- bed12ToBed6
- bedpeToBam
- bedToBam
- bedToIgv
- bedtools
- closestBed
- clusterBed
- complementBed
- coverageBed
- expandCols
- fastaFromBed
- flankBed
- genomeCoverageBed
- getOverlap
- groupBy
- intersectBed
- linksBed
- mapBed
- maskFastaFromBed
- mergeBed
- multiBamCov
- multiIntersectBed
- nucBed
- pairToBed
- pairToPair
- randomBed
- shiftBed
- shuffleBed
- slopBed
- sortBed
- subtractBed
- tagBam
- unionBedGraphs
- windowBed
- windowMaker

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bedtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bedtools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bedtools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bedtools

    bedtools intersect -a a.bed -b b.bed
    bedtools annotate -i variants.bed -files genes.bed conserve.bed known_var.bed
.. _Github: https://github.com/arq5x/bedtools2
