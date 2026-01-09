.. _backbone-label:

Snp-dists
==============================

Introduction
~~~~~~~~
Snp-dists is a tool to convert a FASTA alignment to SNP distance matrix.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/snp-dists 
| Home page: https://github.com/tseemann/snp-dists

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.8.2

Commands
~~~~~~~
- snp-dists

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load snp-dists

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run snp-dists on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=snp-dists
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers snp-dists

