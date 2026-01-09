.. _backbone-label:

Trtools
==============================

Introduction
~~~~~~~~
TRTools includes a variety of utilities for filtering, quality control and analysis of tandem repeats downstream of genotyping them from next-generation sequencing.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/trtools 
| Home page: https://github.com/gymreklab/TRTools

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 5.0.1
  * - BELL
    - 5.0.1
  * - GAUTSCHI
    - 5.0.1
  * - NEGISHI
    - 5.0.1
  * - SCHOLAR
    - 5.0.1

Commands
~~~~~~~
- associaTR
- compareSTR
- dumpSTR
- mergeSTR
- qcSTR
- statSTR

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load trtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

.. warning::
    We noticed that ``xalt`` module can cause the failure of certain commands including ``statSTR``. Please unload all loaded modules by ``module --force purge`` before loading required modules. 

To run trtools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=trtools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers trtools htslib bcftools 

    mergeSTR --vcfs ceu_ex.vcf.gz,yri_ex.vcf.gz --out merged
    bgzip merged.vcf
    tabix -p vcf merged.vcf.gz
     
    # Get the CEU and YRI sample lists
    bcftools query -l yri_ex.vcf.gz > yri_samples.txt
    bcftools query -l ceu_ex.vcf.gz > ceu_samples.txt

    # Run statSTR on region chr21:35348646-35348646 (hg38)
    statSTR \
        --vcf merged.vcf.gz \
        --samples yri_samples.txt,ceu_samples.txt \
        --sample-prefixes YRI,CEU \
        --out stdout \
        --mean --het --acount \
        --use-length \
        --region chr21:34351482-34363028
