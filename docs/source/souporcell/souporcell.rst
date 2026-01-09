.. _backbone-label:

Souporcell
==============================

Introduction
~~~~~~~~
souporcell is a method for clustering mixed-genotype scRNAseq experiments by individual.


| For more information, please check:
| Home page: https://github.com/wheaton5/souporcell

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.0
  * - BELL
    - 2.0
  * - GAUTSCHI
    - 2.0
  * - NEGISHI
    - 2.0
  * - SCHOLAR
    - 2.0

Commands
~~~~~~~
- check_modules.py
- compile_stan_model.py
- consensus.py
- renamer.py
- retag.py
- shared_samples.py
- souporcell.py
- souporcell_pipeline.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load souporcell

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run souporcell on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=souporcell
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers souporcell

    souporcell_pipeline.py -i A.merged.bam \
        -b GSM2560245_barcodes.tsv \
        -f refdata-cellranger-GRCh38-3.0.0/fasta/genome.fa \
        -t 8 -o demux_data_test -k 4
