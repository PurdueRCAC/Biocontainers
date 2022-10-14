.. _backbone-label:

Csvtk
==============================

Introduction
~~~~~~~~
``Csvtk`` is a cross-platform, efficient and practical CSV/TSV toolkit. |For more information, please check its website: https://biocontainers.pro/tools/csvtk and its home page on `Github`_.

Versions
~~~~~~~~
- 0.23.0
- 0.25.0

Commands
~~~~~~~
- csvtk

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load csvtk

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Csvtk on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=csvtk
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers csvtk

    cat data.csv \
     | csvtk summary --ignore-non-digits --fields f4:sum,f5:sum --groups f1,f2 \
     | csvtk pretty

.. _Github: https://github.com/shenwei356/csvtk
