.. _backbone-label:

Rnaquast
==============================

Introduction
~~~~~~~~
``Rnaquast`` is a quality assessment tool for de novo transcriptome assemblies. 

| For more information, please check its website: https://biocontainers.pro/tools/rnaquast and its home page: http://cab.spbu.ru/software/rnaquast/.

Versions
~~~~~~~~
- 2.2.1

Commands
~~~~~~~
- rnaQUAST.py

Dependencies de novo quality assessment and read alignment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. note::

      When reference genome and gene database are unavailable, users can also use ``BUSCO`` and ``GeneMarkS-T`` in rnaQUAST pipeline. Since ``GeneMarkS-T`` requires the license key, users may need to download your own key, and put it in your $HOME. 
      rnaQUAST is also capable of calculating various statistics using raw reads (e.g. database coverage by reads). To use this, you will need use ``STAR`` in the pipeline.
      ``BUSCO``, ``GeneMarkS-T``, and ``STAR`` have been installed, and the directories of their exectuables have been added to $PATH. Users do not need to load these modules. The only module required is ``rnaquast`` itself.   
      
Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load rnaquast

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Rnaquast on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=rnaquast
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rnaquast

    rnaQUAST.py -t 12 -o output \
         --transcripts Trinity.fasta idba.fasta \
         --reference Saccharomyces_cerevisiae.R64-1-1.75.dna.toplevel.fa \
         --gtf Saccharomyces_cerevisiae.R64-1-1.75.gtf

    rnaQUAST.py -t 12 -o output2 \
         --reference reference.fasta \
         --transcripts transcripts.fasta \
         --left_reads lef.fastq \
         --right_reads right.fastq \
         --busco fungi_odb10
