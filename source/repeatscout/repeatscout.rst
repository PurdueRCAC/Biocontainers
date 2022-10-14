.. _backbone-label:

RepeatScout
==============================

Introduction
~~~~~~~~
``RepeatScout`` is a tool to discover repetitive substrings in DNA. |For more information, please check its website: https://biocontainers.pro/tools/repeatscout and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0.6

Commands
~~~~~~~
- RepeatScout
- build_lmer_table
- compare-out-to-gff.prl
- filter-stage-1.prl
- filter-stage-2.prl
- merge-lmer-tables.prl

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load repeatscout

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run RepeatScout on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=repeatscout
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers repeatscout

    build_lmer_table -l 14 -sequence genome.fasta -freq Final_assembly.freq

    RepeatScout -sequence genome.fasta -output Final_assembly_repeats.fasta -freq Final_assembly.freq -l 14
.. _Github: https://github.com/mmcco/RepeatScout
