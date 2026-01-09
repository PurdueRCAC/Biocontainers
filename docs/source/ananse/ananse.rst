.. _backbone-label:

Ananse
==============================

Introduction
~~~~~~~~
ANANSE is a computational approach to infer enhancer-based gene regulatory networks (GRNs) and to identify key transcription factors between two GRNs.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/ananse 
| Home page: https://github.com/vanheeringen-lab/ANANSE

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.4.0
  * - BELL
    - 0.4.0
  * - GAUTSCHI
    - 0.4.0
  * - NEGISHI
    - 0.4.0
  * - SCHOLAR
    - 0.4.0

Commands
~~~~~~~
- ananse

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ananse

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ananse on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ananse
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ananse

    mkdir -p ANANSE.REMAP.model.v1.0
    wget https://zenodo.org/record/4768075/files/ANANSE.REMAP.model.v1.0.tgz
    tar xvzf ANANSE.REMAP.model.v1.0.tgz -C ANANSE.REMAP.model.v1.0
    rm ANANSE.REMAP.model.v1.0.tgz

    wget https://zenodo.org/record/4769814/files/ANANSE_example_data.tgz
    tar xvzf ANANSE_example_data.tgz
    rm ANANSE_example_data.tgz

    ananse binding -H ANANSE_example_data/H3K27ac/fibroblast*bam -A ANANSE_example_data/ATAC/fibroblast*bam -R ANANSE.REMAP.model.v1.0/ -o fibroblast.binding
    ananse binding -H ANANSE_example_data/H3K27ac/heart*bam -A ANANSE_example_data/ATAC/heart*bam -R ANANSE.REMAP.model.v1.0/ -o heart.binding

    ananse network -b  fibroblast.binding/binding.h5 -e ANANSE_example_data/RNAseq/fibroblast*TPM.txt -n 4 -o fibroblast.network.txt
    ananse network -b  heart.binding/binding.h5 -e ANANSE_example_data/RNAseq/heart*TPM.txt -n 4 -o heart.network.txt

    ananse influence -s fibroblast.network.txt -t heart.network.txt -d ANANSE_example_data/RNAseq/fibroblast2heart_degenes.csv -p -o fibroblast2heart.influence.txt
