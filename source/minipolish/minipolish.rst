.. _backbone-label:

Minipolish
==============================

Introduction
~~~~~~~~
Minipolish is a tool for Racon polishing of miniasm assemblies.

| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/minipolish 
| Home page: https://github.com/rrwick/Minipolish

Versions
~~~~~~~~
- 0.1.3

Commands
~~~~~~~
- minipolish

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load minipolish

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run minipolish on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=minipolish
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers minipolish

    minipolish -t 8 long_reads.fastq.gz assembly.gfa > polished.gfa
