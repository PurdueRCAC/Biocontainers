.. _backbone-label:  

rMATS
============================== 

Introduction
~~~~~~~
``MATS`` is a computational tool to detect differential alternative splicing events from RNA-Seq data. The statistical model of MATS calculates the P-value and false discovery rate that the difference in the isoform ratio of a gene between two conditions exceeds a given user-defined threshold. From the RNA-Seq data, MATS can automatically detect and analyze alternative splicing events corresponding to all major types of alternative splicing patterns. MATS handles replicate RNA-Seq data from both paired and unpaired study design. 

Detailed usage can be found here: http://rnaseq-mats.sourceforge.net


Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 4.1.1
  * - BELL
    - 4.1.1, 4.3.0
  * - GAUTSCHI
    - 4.1.1
  * - NEGISHI
    - 4.1.1, 4.3.0
  * - SCHOLAR
    - 4.1.1

Commands
~~~~~~
- rmats.py

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load rmats 

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rmats on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=rmats
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rmats
    
    rmats.py --b1 SR_b1.txt --b2 SR_b2.txt --gtf Homo_sapiens.GRCh38.105.gtf --od rmats_out_homo --tmp rmats_tmp  -t paired --nthread 10 --readLength 150
