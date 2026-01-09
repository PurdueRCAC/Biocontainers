.. _backbone-label:

STAR-Fusion
==============================

Introduction
~~~~~~~~
``STAR-Fusion`` is a component of the Trinity Cancer Transcriptome Analysis Toolkit (CTAT). 

| For more information, please check its | Docker hub: https://hub.docker.com/r/trinityctat/starfusion and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.11b
  * - BELL
    - 1.11b
  * - GAUTSCHI
    - 1.11b
  * - NEGISHI
    - 1.11b
  * - SCHOLAR
    - 1.11b

Commands
~~~~~~~
- STAR-Fusion

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load starfusion

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run STAR-Fusion on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=starfusion
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers starfusion

    STAR-Fusion --CPU 24 --left_fq ../star/SRR12095148_1.fastq --right_fq  ../star/SRR12095148_2.fastq\
         --genome_lib_dir  GRCh38_gencode_v33_CTAT_lib_Apr062020.plug-n-play/ctat_genome_lib_build_dir \
         --FusionInspector validate \
         --denovo_reconstruct \
         --examine_coding_effect \
         --output_dir STAR-Fusion-output
.. _Github: https://github.com/STAR-Fusion/STAR-Fusion/wiki
