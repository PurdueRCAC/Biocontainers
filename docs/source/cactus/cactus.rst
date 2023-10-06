.. _backbone-label:

Cactus
==============================

Introduction
~~~~~~~~
``Cactus`` is a reference-free whole-genome multiple alignment program. 

| For more information, please check its website: https://biocontainers.pro/tools/cactus and its home page on `Github`_.

Versions
~~~~~~~~
- 2.0.5
- 2.2.1
- 2.2.3-gpu
- 2.2.3
- 2.4.0-gpu
- 2.4.0
- 2.5.2
- 2.6.5

Commands
~~~~~~~
- cactus
- cactus-align
- cactus-align-batch
- cactus-blast
- cactus-graphmap
- cactus-graphmap-join
- cactus-graphmap-split
- cactus-minigraph
- cactus-prepare
- cactus-prepare-toil
- cactus-preprocess
- cactus-refmap
- cactus2hal-stitch.sh
- cactus2hal.py
- cactusAPITests
- cactus_analyseAssembly
- cactus_barTests
- cactus_batch_mergeChunks
- cactus_chain
- cactus_consolidated
- cactus_covered_intervals
- cactus_fasta_fragments.py
- cactus_fasta_softmask_intervals.py
- cactus_filterSmallFastaSequences.py
- cactus_halGeneratorTests
- cactus_local_alignment.py
- cactus_makeAlphaNumericHeaders.py
- cactus_softmask2hardmask

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load cactus

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Cactus on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cactus
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cactus

    wget https://raw.githubusercontent.com/ComparativeGenomicsToolkit/cactus/master/examples/evolverMammals.txt
    cactus jobStore evolverMammals.txt evolverMammals.hal

.. _Github: https://github.com/ComparativeGenomicsToolkit/cactus
