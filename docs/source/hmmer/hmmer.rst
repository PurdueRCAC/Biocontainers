.. _backbone-label:

Hmmer
==============================

Introduction
~~~~~~~~
``Hmmer`` is used for searching sequence databases for sequence homologs, and for making sequence alignments. 

| For more information, please check its website: https://biocontainers.pro/tools/hmmer and its home page: http://hmmer.org.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 3.3.2
  * - BELL
    - 3.3.2
  * - GAUTSCHI
    - 3.3.2
  * - NEGISHI
    - 3.3.2
  * - SCHOLAR
    - 3.3.2

Commands
~~~~~~~
- alimask
- easel
- esl-afetch
- esl-alimanip
- esl-alimap
- esl-alimask
- esl-alimerge
- esl-alipid
- esl-alirev
- esl-alistat
- esl-compalign
- esl-compstruct
- esl-construct
- esl-histplot
- esl-mask
- esl-mixdchlet
- esl-reformat
- esl-selectn
- esl-seqrange
- esl-seqstat
- esl-sfetch
- esl-shuffle
- esl-ssdraw
- esl-translate
- esl-weight
- hmmalign
- hmmbuild
- hmmconvert
- hmmemit
- hmmfetch
- hmmlogo
- hmmpgmd
- hmmpgmd_shard
- hmmpress
- hmmscan
- hmmsearch
- hmmsim
- hmmstat
- jackhmmer
- makehmmerdb
- nhmmer
- nhmmscan
- phmmer

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load hmmer

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Hmmer on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=hmmer
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers hmmer
   
    hmmsearch Nramp.hmm protein.fa > out
