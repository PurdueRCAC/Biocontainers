.. _backbone-label:

Transabyss
==============================

Introduction
~~~~~~~~
``Transabyss`` is a tool for De novo assembly of RNAseq data using ABySS. | For more information, please check its website: https://bioconda.github.io/recipes/transabyss and its home page on `Github`_.

Versions
~~~~~~~~
- 2.0.1

Commands
~~~~~~~
- transabyss
- transabyss-merge

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load transabyss

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Transabyss on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=transabyss
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers transabyss

    transabyss --name  SRR12095148 \
        --pe SRR12095148_1.fastq SRR12095148_2.fastq \
        --outdir  SRR12095148_assembly  --threads 12

.. _Github: https://github.com/bcgsc/transabyss
