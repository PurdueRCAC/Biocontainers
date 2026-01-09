.. _backbone-label:

Blobtools
==============================

Introduction
~~~~~~~~
Blobtools is a modular command-line solution for visualisation, quality control and taxonomic partitioning of genome datasets.


| For more information, please check:
| Home page: https://blobtools.readme.io/docs/what-is-blobtools

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.1.1

Commands
~~~~~~~
- blobtools

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load blobtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run blobtools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=blobtools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers blobtools

