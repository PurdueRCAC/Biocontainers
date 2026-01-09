.. _backbone-label:

Mitofinder
==============================

Introduction
~~~~~~~~
Mitofinder is a pipeline to assemble mitochondrial genomes and annotate mitochondrial genes from trimmed read sequencing data.


| For more information, please check:
| Singularity library: https://cloud.sylabs.io/library/remiallio/default/mitofinder 
| Home page: https://github.com/RemiAllio/MitoFinder

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.4.1

Commands
~~~~~~~
- mitofinder

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load mitofinder

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run mitofinder on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mitofinder
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mitofinder

