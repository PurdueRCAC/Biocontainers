.. _backbone-label:

Ncbi-genome-download
==============================

Introduction
~~~~~~~~
``Ncbi-genome-download`` is a script to download genomes from the NCBI FTP servers. |For more information, please check its website: https://biocontainers.pro/tools/ncbi-genome-download and its home page on `Github`_.

Versions
~~~~~~~~
- 0.3.1

Commands
~~~~~~~
- ncbi-genome-download

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load ncbi-genome-download

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Ncbi-genome-download on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=ncbi-genome-download
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ncbi-genome-download

    ncbi-genome-download bacteria,viral --parallel 4
    ncbi-genome-download --genera "Streptomyces coelicolor,Escherichia coli" bacteria
    ncbi-genome-download --species-taxids 562 bacteria

.. _Github: https://github.com/kblin/ncbi-genome-download
