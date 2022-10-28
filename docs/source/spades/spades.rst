.. _backbone-label:  

SPAdes
============================== 

Introduction
~~~~~~~
``SPAdes``- St. Petersburg genome assembler - is an assembly toolkit containing various assembly pipelines.  

Detailed usage can be found here: https://github.com/ablab/spades


Versions
~~~~~~~~
- 3.15.3
- 3.15.4
- 3.15.5

Commands
~~~~~~
- coronaspades.py
- metaplasmidspades.py
- metaspades.py
- metaviralspades.py
- plasmidspades.py
- rnaspades.py
- rnaviralspades.py
- spades.py
- spades_init.py
- truspades.py
- spades-bwa
- spades-convert-bin-to-fasta
- spades-core
- spades-corrector-core
- spades-gbuilder
- spades-gmapper
- spades-gsimplifier
- spades-hammer
- spades-ionhammer
- spades-kmer-estimating
- spades-kmercount
- spades-read-filter
- spades-truseq-scfcorrection

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load spades 

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run spades on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=spades
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers spades
    
    spades.py --pe1-1 SRR11234553_1.fastq --pe1-2 SRR11234553_2.fastq -o spades_out -t 24 
