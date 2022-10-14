.. _backbone-label:

Bustools
==============================

Introduction
~~~~~~~~
``Bustools`` is a program for manipulating BUS files for single cell RNA-Seq datasets. 
| For more information, please check its website: https://biocontainers.pro/tools/bustools and its home page on `Github`_.

Versions
~~~~~~~~
- 0.41.0

Commands
~~~~~~~
- bustools

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bustools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bustools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bustools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bustools

    bustools capture -s -o cDNA_capture.bus -c cDNA_transcripts.to_capture.txt -e matrix.ec -t transcripts.txt output.correct.sort.bus
    bustools count -o u -g cDNA_introns_t2g.txt -e matrix.ec -t transcripts.txt --genecounts cDNA_capture.bus 



.. _Github: https://github.com/BUStools/bustools
