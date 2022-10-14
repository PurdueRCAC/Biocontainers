.. _backbone-label:

Cufflinks
==============================

Introduction
~~~~~~~~
``Cufflinks`` assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples. It accepts aligned RNA-Seq reads and assembles the alignments into a parsimonious set of transcripts. Cufflinks then estimates the relative abundances of these transcripts based on how many reads support each one, taking into account biases in library preparation protocols. 
| For more information, please check its website: https://biocontainers.pro/tools/cufflinks and its home page on `Github`_.

Versions
~~~~~~~~
- 2.2.1-py36

Commands
~~~~~~~
- cuffcompare
- cuffdiff
- cufflinks
- cuffmerge
- cuffnorm
- cuffquant
- gffread
- gtf_to_sam

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load cufflinks

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Cufflinks on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=cufflinks
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cufflinks

    cufflinks -p 8 -G transcript.gtf --library-type fr-unstranded -o cufflinks_output tophat_out/accepted_hits.bam
.. _Github: https://cole-trapnell-lab.github.io/cufflinks/
