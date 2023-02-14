.. _backbone-label:

Epic2
==============================

Introduction
~~~~~~~~
``Epic2`` is an ultraperformant Chip-Seq broad domain finder based on SICER. 

| For more information, please check its website: https://biocontainers.pro/tools/epic2 and its home page on `Github`_.

Versions
~~~~~~~~
- 0.0.51
- 0.0.52

Commands
~~~~~~~
- epic2
- epic2-bw
- epic2-df

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load epic2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead. 

To run Epic2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=epic2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers epic2

    epic2 -t /examples/test.bed.gz \
      -c /examples/control.bed.gz \
      > deleteme.txt
.. _Github: https://github.com/biocore-ntnu/epic2
