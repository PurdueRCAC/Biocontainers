.. _backbone-label:

Chopper
==============================

Introduction
~~~~~~~~
Chopper is Rust implementation of NanoFilt+NanoLyse, both originally written in Python. This tool, intended for long read sequencing such as PacBio or ONT, filters and trims a fastq file. Filtering is done on average read quality and minimal or maximal read length, and applying a headcrop (start of read) and tailcrop (end of read) while printing the reads passing the filter.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/chopper 
| Home page: https://github.com/wdecoster/chopper

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.2.0
  * - BELL
    - 0.2.0
  * - GAUTSCHI
    - 0.2.0
  * - NEGISHI
    - 0.2.0
  * - SCHOLAR
    - 0.2.0

Commands
~~~~~~~
- chopper

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load chopper

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run chopper on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=chopper
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers chopper
