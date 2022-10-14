.. _backbone-label:

Abyss
==============================

Introduction
~~~~~~~~
``ABySS`` is a de novo sequence assembler intended for short paired-end reads and genomes of all sizes. 
| For more information, please check its website: https://biocontainers.pro/tools/abyss and its home page on `Github`_.

Versions
~~~~~~~~
- 2.3.2
- 2.3.4

Commands
~~~~~~~
- ABYSS 
- ABYSS-P 
- AdjList 
- Consensus
- DAssembler 
- DistanceEst
- DistanceEst-ssq 
- KAligner
- MergeContigs 
- MergePaths 
- Overlap 
- ParseAligns
- PathConsensus 
- PathOverlap
- PopBubbles 
- SimpleGraph
- abyss-align 
- abyss-bloom 
- abyss-bloom-dbg
- abyss-bowtie 
- abyss-bowtie2 
- abyss-bwa 
- abyss-bwamem
- abyss-bwasw 
- abyss-db-txt 
- abyss-dida 
- abyss-fac
- abyss-fatoagp 
- abyss-filtergraph 
- abyss-fixmate
- abyss-fixmate-ssq 
- abyss-gapfill 
- abyss-gc
- abyss-index 
- abyss-junction 
- abyss-kaligner
- abyss-layout 
- abyss-longseqdist 
- abyss-map
- abyss-map-ssq 
- abyss-mergepairs 
- abyss-overlap
- abyss-paired-dbg 
- abyss-paired-dbg-mpi 
- abyss-pe
- abyss-rresolver-short 
- abyss-samtoafg
- abyss-scaffold 
- abyss-sealer 
- abyss-stack-size
- abyss-tabtomd 
- abyss-todot 
- abyss-tofastq
- konnector 
- logcounter

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load abyss

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run abyss on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=abyss
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers abyss
    
    abyss-pe np=4 k=25 name=test B=1G \
        in='test-data/reads1.fastq test-data/reads2.fastq'


.. _Github: https://github.com/bcgsc/abyss/
