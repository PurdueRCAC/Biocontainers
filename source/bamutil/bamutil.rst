.. _backbone-label:

Bamutil
==============================

Introduction
~~~~~~~~
``Bamutil`` is a collection of programs for working on SAM/BAM files. |For more information, please check its website: https://biocontainers.pro/tools/bamutil and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0.15

Commands
~~~~~~~
- bam

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bamutil

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bamutil on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bamutil
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bamutil

    bam validate --params --in test/testFiles/testInvalid.sam --refFile test/testFilesLibBam/chr1_partial.fa --v --noph 2> results/validateInvalid.txt

    bam convert --params --in test/testFiles/testFilter.bam --out results/convertBam.sam --noph 2> results/convertBam.log

    bam  splitChromosome --in test/testFile/sortedBam1.bam --out results/splitSortedBam --noph 2> results/splitChromosome.txt

    bam stats --basic --in test/testFiles/testFilter.sam --noph 2> results/basicStats.txt 

    bam gapInfo --in test/testFiles/testGapInfo.sam --out results/gapInfo.txt --noph 2> results/gapInfo.log

    bam findCigars --in test/testFiles/testRevert.sam --out results/cigarNonM.sam --nonM --noph 2> results/cigarNonM.log
.. _Github: https://github.com/statgen/bamUtil

