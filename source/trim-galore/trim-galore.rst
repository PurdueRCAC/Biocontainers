.. _backbone-label:

Trim-galore
==============================

Introduction
~~~~~~~~
``Trim-galore`` is a wrapper tool that automates quality and adapter trimming to FastQ files. 

| For more information, please check its website: https://biocontainers.pro/tools/trim-galore and its home page: https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/.

Versions
~~~~~~~~
- 0.6.7

Commands
~~~~~~~
- trim_galore

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load trim-galore

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Trim-galore on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=trim-galore
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers trim-galore
   
    trim_galore  --paired --fastqc --length 20 -o sample1_trimmed Sample1_1.fq Sample1_2.fq
