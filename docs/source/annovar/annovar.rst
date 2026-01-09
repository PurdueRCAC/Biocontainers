.. _backbone-label:

ANNOVAR
==============================

Introduction
~~~~~~~~
``ANNOVAR`` is an efficient software tool to utilize update-to-date information to functionally annotate genetic variants detected from diverse genomes (including human genome hg18, hg19, hg38, as well as mouse, worm, fly, yeast and many others). 

| For more information, please check its website: https://annovar.openbioinformatics.org/en/latest/.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2022-01-13
  * - BELL
    - 2022-01-13
  * - GAUTSCHI
    - 2022-01-13
  * - NEGISHI
    - 2022-01-13
  * - SCHOLAR
    - 2022-01-13

Commands
~~~~~~~
- annotate_variation.pl
- coding_change.pl
- convert2annovar.pl
- retrieve_seq_from_fasta.pl
- table_annovar.pl
- variants_reduction.pl

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load annovar

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ANNOVAR on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=annovar
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers annovar

    annotate_variation.pl --buildver hg19 --downdb seq humandb/hg19_seq
    convert2annovar.pl -format region -seqdir humandb/hg19_seq/ chr1:2000001-2000003

