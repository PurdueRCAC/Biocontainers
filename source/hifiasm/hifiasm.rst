.. _backbone-label:

Hifiasm
==============================

Introduction
~~~~~~~~
``Hifiasm`` is a fast haplotype-resolved de novo assembler for PacBio HiFi reads. | For more information, please check its website: https://biocontainers.pro/tools/hifiasm and its home page on `Github`_.

Versions
~~~~~~~~
- 0.16.0

Commands
~~~~~~~
- hifiasm

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load hifiasm

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Hifiasm on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=hifiasm
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers hifiasm

.. _Github: https://github.com/chhylp123/hifiasm
