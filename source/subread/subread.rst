.. _backbone-label:

Subread
==============================

Introduction
~~~~~~~~
``Subread`` carries out high-performance read alignment, quantification and mutation discovery.  It is a general-purpose read aligner which can be used to map both genomic DNA-seq reads and DNA-seq reads. It uses a new mapping paradigm called seed-and-vote to achieve fast, accurate and scalable read mapping. Subread automatically determines if a read should be globally or locally aligned, therefore particularly powerful in mapping RNA-seq reads. It supports INDEL detection and can map reads with both fixed and variable lengths.
For more information, please check its website: https://biocontainers.pro/tools/subread and its home page: http://subread.sourceforge.net.

Versions
~~~~~~~~
- 1.6.4
- 2.0.1

Commands
~~~~~~~
- detectionCall
- exactSNP
- featureCounts
- flattenGTF
- genRandomReads
- propmapped
- qualityScores
- removeDup
- repair
- subindel
- subjunc
- sublong
- subread-align
- subread-buildindex
- subread-fullscan
- txUnique

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load subread

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Subread on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=subread
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers subread

    featureCounts -s 2 -p -Q 10 -T 4 -a genome.gtf -o featurecounts.txt mapped.bam
