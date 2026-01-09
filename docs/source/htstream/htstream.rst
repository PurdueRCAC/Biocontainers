.. _backbone-label:

Htstream
==============================

Introduction
~~~~~~~~
Htstream is a quality control and processing pipeline for High Throughput Sequencing data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/htstream 
| Home page: https://s4hts.github.io/HTStream/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.3.3

Commands
~~~~~~~
- hts_AdapterTrimmer
- hts_CutTrim
- hts_LengthFilter
- hts_NTrimmer
- hts_Overlapper
- hts_PolyATTrim
- hts_Primers
- hts_QWindowTrim
- hts_SeqScreener
- hts_Stats
- hts_SuperDeduper

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load htstream

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run htstream on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=htstream
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers htstream

