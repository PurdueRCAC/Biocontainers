.. _backbone-label:

Pycoqc
==============================

Introduction
~~~~~~~~
``Pycoqc`` is a tool that computes metrics and generates interactive QC plots for Oxford Nanopore technologies sequencing data. |For more information, please check its website: https://biocontainers.pro/tools/pycoqc and its home page on `Github`_.

Versions
~~~~~~~~
- 2.5.2

Commands
~~~~~~~
- pycoQC
- python
- python3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load pycoqc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Pycoqc on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pycoqc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pycoqc

    pycoQC \
        -f Albacore-1.2.1_basecall-1D-DNA_sequencing_summary.txt\
         -o Albacore-1.2.1_basecall-1D-DNA.html \
        --quiet

.. _Github: https://github.com/a-slide/pycoQC
