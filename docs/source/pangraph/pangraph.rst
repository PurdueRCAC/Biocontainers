.. _backbone-label:

Pangraph
==============================

Introduction
~~~~~~~~
Pangraph is a bioinformatic toolkit to align genome assemblies into pangenome graphs.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/neherlab/pangraph 
| Home page: https://github.com/neherlab/pangraph

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.7.1

Commands
~~~~~~~
- pangraph

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pangraph

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pangraph on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pangraph
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pangraph

