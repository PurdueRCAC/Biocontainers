.. _backbone-label:

Parliament2
==============================

Introduction
~~~~~~~~
Parliament2 identifies structural variants in a given sample relative to a reference genome. These structural variants cover large deletion events that are called as Deletions of a region, Insertions of a sequence into a region, Duplications of a region, Inversions of a region, or Translocations between two regions in the genome.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/dnanexus/parliament2 
| Home page: https://github.com/fritzsedlazeck/parliament2

Versions
~~~~~~~~
- 0.1.11

Commands
~~~~~~~
- parliament2.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load parliament2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run parliament2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=parliament2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers parliament2
