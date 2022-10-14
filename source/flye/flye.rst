.. _backbone-label:

Flye
==============================

Introduction
~~~~~~~~
``Flye``: Fast and accurate de novo assembler for single molecule sequencing reads. | For more information, please check its website: https://biocontainers.pro/tools/flye and its home page on `Github`_.

Versions
~~~~~~~~
- 2.9.1
- 2.9
- 2.9-py38

Commands
~~~~~~~
- flye

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load flye

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Flye on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=flye
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers flye

    flye --pacbio-raw E.coli_PacBio_40x.fasta --out-dir out_pacbio --threads 12
    flye --nano-raw Loman_E.coli_MAP006-1_2D_50x.fasta --out-dir out_nano --threads 12
.. _Github: https://github.com/fenderglass/Flye
