.. _backbone-label:

Motus
==============================

Introduction
~~~~~~~~
The mOTU profiler is a computational tool that estimates relative taxonomic abundance of known and currently unknown microbial community members using metagenomic shotgun sequencing data.


| For more information, please check:
| Home page: https://github.com/motu-tool/mOTUs

Versions
~~~~~~~~
- 3.0.3

Commands
~~~~~~~
- motus

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load motus

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run motus on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=motus
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers motus
