.. _backbone-label:

Crispritz
==============================

Introduction
~~~~~~~~
``Crispritz`` is a software package containing 5 different tools dedicated to perform predictive analysis and result assessement on CRISPR/Cas experiments. 

| For more information, please check its website: https://biocontainers.pro/tools/crispritz and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.6.5
  * - BELL
    - 2.6.5
  * - GAUTSCHI
    - 2.6.5
  * - NEGISHI
    - 2.6.5
  * - SCHOLAR
    - 2.6.5

Commands
~~~~~~~
- crispritz.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load crispritz

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Crispritz on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=crispritz
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers crispritz

    crispritz.py add-variants hg38_1000genomeproject_vcf/ hg38_ref/ &> output.redirect.out 

    crispritz.py index-genome hg38_ref hg38_ref/ 20bp-NGG-SpCas9.txt -bMax 2 &> output.redirect.out 

    crispritz.py search hg38_ref/ 20bp-NGG-SpCas9.txt EMX1.sgRNA.txt emx1.hg38 -mm 4 -t -scores hg38_ref/ &> output.redirect.out

    crispritz.py search genome_library/NGG_2_hg38_ref/ 20bp-NGG-SpCas9.txt EMX1.sgRNA.txt emx1.hg38.bulges -index -mm 4 -bDNA 1 -bRNA 1 -t &> output.redirect.out

    crispritz.py annotate-results emx1.hg38.targets.txt hg38Annotation.bed emx1.hg38 &> output.redirect.out
   
.. _Github: https://github.com/pinellolab/CRISPRitz
