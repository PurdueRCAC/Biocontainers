.. _backbone-label:

Brass
==============================

Introduction
~~~~~~~~
``Brass`` is used to analyze one or more related BAM files of paired-end sequencing to determine potential rearrangement breakpoints. |For more information, please check its website: https://quay.io/repository/wtsicgp/brass and its home page on `Github`_.

Versions
~~~~~~~~
- 6.3.4

Commands
~~~~~~~
- brass-assemble
- brass_bedpe2vcf.pl
- brass_foldback_reads.pl
- brass-group
- brassI_filter.pl
- brassI_np_in.pl
- brassI_pre_filter.pl
- brassI_prep_bam.pl
- brass.pl

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load brass

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Brass on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=brass
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers brass

    brass.pl -c 4 -o myout -t tumour.bam -n normal.bam
.. _Github: https://github.com/cancerit/BRASS#running-brass
