.. _backbone-label:

Lumpy-sv
==============================

Introduction
~~~~~~~~
``Lumpy-sv`` is a general probabilistic framework for structural variant discovery. 

| For more information, please check its website: https://biocontainers.pro/tools/lumpy-sv and its home page on `Github`_.

Versions
~~~~~~~~
- 0.3.1

Commands
~~~~~~~
- lumpy
- lumpyexpress

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load lumpy-sv

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Lumpy-sv on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=lumpy-sv
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers lumpy-sv

    lumpy -mw 4 -tt 0.0 -pe \
    bam_file:AL87.discordant.sort.bam,histo_file:AL87.histo,mean:429,stdev:84,read_length:83,min_non_overlap:83,discordant_z:4,back_distance:1,weight:1,id:1,min_mapping_threshold:20 \
    -sr bam_file:AL87.sr.sort.bam,back_distance:1,weight:1,id:2,min_mapping_threshold:20 

.. _Github: https://github.com/arq5x/lumpy-sv
