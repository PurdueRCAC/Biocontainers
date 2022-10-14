.. _backbone-label:

Genmap
==============================

Introduction
~~~~~~~~
GenMap: Ultra-fast Computation of Genome Mappability.
|For more information, please check:
|BioContainers: https://biocontainers.pro/tools/genmap 
|Home page: https://github.com/cpockrandt/genmap

Versions
~~~~~~~~
- 1.3.0

Commands
~~~~~~~
- genmap

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load genmap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run genmap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=genmap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers genmap
  
    export TMPDIR=$PWD/tmp
    genmap index -F ~/.local/share/genomes/hg38/hg38.fa  -I hg38_index
    genmap map -K 64 -E 2 -I hg38_index -O map_output_hg38 -t -w -bg
