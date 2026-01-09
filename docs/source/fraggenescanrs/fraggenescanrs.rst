.. _backbone-label:

Fraggenescanrs
==============================

Introduction
~~~~~~~~
FragGeneScanRs is a better and faster Rust implementation of the FragGeneScan gene prediction model for short and error-prone reads. Its command line interface is backward compatible and adds extra features for more flexible usage. Compared to the original C implementation, shotgun metagenomic reads are processed up to 22 times faster using a single thread, with better scaling for multithreaded execution.


| For more information, please check:
| Home page: https://github.com/unipept/FragGeneScanRs

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.1.0

Commands
~~~~~~~
- FragGeneScanRs

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load fraggenescanrs

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run fraggenescanrs on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fraggenescanrs
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fraggenescanrs

