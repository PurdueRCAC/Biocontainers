.. _backbone-label:

Seidr
==============================

Introduction
~~~~~~~~
``Seidr`` is a community gene network inference and exploration toolkit. |For more information, please check its website: https://biocontainers.pro/tools/seidr and its home page on `Github`_.

Versions
~~~~~~~~
- 0.14.2

Commands
~~~~~~~
- correlation
- seidr
- mi
- pcor
- narromi
- plsnet
- llr-ensemble
- svm-ensemble
- genie3
- tigress
- el-ensemble
- makeconv
- genrb
- gencfu
- gencnval
- gendict
- tomsimilarity

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load seidr

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Seidr on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=seidr
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers seidr

.. _Github: https://github.com/bschiffthaler/seidr
