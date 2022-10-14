.. _backbone-label:

Lofreq
==============================

Introduction
~~~~~~~~
``Lofreq`` is a fast and sensitive variant-caller for inferring SNVs and indels from next-generation sequencing data. 

| For more information, please check its website: https://biocontainers.pro/tools/lofreq and its home page on `Github`_.

Versions
~~~~~~~~
- 2.1.5

Commands
~~~~~~~
- lofreq

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load lofreq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Lofreq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=lofreq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers lofreq

    lofreq  call -f ref.fa -o vars.vcf out_sorted.bam

    lofreq call-parallel --pp-threads 8 \
         -f ref.fa -o vars_pallel.vcf out_sorted.bam

.. _Github: https://csb5.github.io/lofreq/
