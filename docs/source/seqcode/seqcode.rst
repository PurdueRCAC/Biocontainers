.. _backbone-label:

Seqcode
==============================

Introduction
~~~~~~~~
SeqCode is a family of applications designed to develop high-quality images and perform genome-wide calculations from high-throughput sequencing experiments. This software is presented into two distinct modes: web tools and command line. The website of SeqCode offers most functions to users with no previous expertise in bioinformatics, including operations on a selection of published ChIP-seq samples and applications to generate multiple classes of graphics from data files of the user. On the contrary, the standalone version of SeqCode allows bioinformaticians to run each command on any type of sequencing data locally in their computer. The architecture of the source code is modular and the input/output interface of the commands is suitable to be integrated into existing pipelines of genome analysis. SeqCode has been written in ANSI C, which favors the compatibility in every UNIX platform and grants a high performance and speed when analyzing sequencing data. Meta-plots, heatmaps, boxplots and the rest of images produced by SeqCode are internally generated using R. SeqCode relies on the RefSeq reference annotations and is able to deal with the genome and assembly release of every organism that is available from this consortium.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/eblancocrg/seqcode 
| Home page: https://github.com/eblancoga/seqcode

Versions
~~~~~~~~
- 1.0

Commands
~~~~~~~
- buildChIPprofile
- combineChIPprofiles
- combineTSSmaps
- combineTSSplots
- computemaxsignal
- findPeaks
- genomeDistribution
- matchpeaks
- matchpeaksgenes
- processmacs
- produceGENEmaps
- produceGENEplots
- producePEAKmaps
- producePEAKplots
- produceTESmaps
- produceTESplots
- produceTSSmaps
- produceTSSplots
- recoverChIPlevels
- scorePhastCons

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load seqcode

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run seqcode on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=seqcode
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers seqcode

    buildChIPprofile -vd ChromInfo.txt \
         H3K4me3_sample.bam test_buildChIPprofile
