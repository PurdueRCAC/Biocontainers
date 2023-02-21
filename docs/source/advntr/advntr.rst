.. _backbone-label:

Advntr
==============================

Introduction
~~~~~~~~
``Advntr`` is a tool for genotyping Variable Number Tandem Repeats (VNTR) from sequence data. 

| For more information, please check its website: https://biocontainers.pro/tools/advntr and its home page on `Github`_.

Versions
~~~~~~~~
- 1.4.0
- 1.5.0

Commands
~~~~~~~
- advntr

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load advntr

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Advntr on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=advntr
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers advntr
 
    advntr addmodel -r chr21.fa -p CGCGGGGCGGGG -s 45196324 -e 45196360 -c chr21
    advntr genotype --vntr_id 1 --alignment_file CSTB_2_5_testdata.bam --working_directory working_dir
.. _Github: https://github.com/mehrdadbakhtiari/adVNTR
