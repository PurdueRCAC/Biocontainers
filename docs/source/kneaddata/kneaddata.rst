.. _backbone-label:  

KneadData
============================== 

Introduction
~~~~~~~
``KneadData`` is a tool designed to perform quality control on metagenomic and metatranscriptomic sequencing data, especially data from microbiome experiments. In these experiments, samples are typically taken from a host in hopes of learning something about the microbial community on the host.   

Detailed usage can be found here: https://huttenhower.sph.harvard.edu/kneaddata/


Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.10.0
  * - BELL
    - 0.10.0
  * - GAUTSCHI
    - 0.10.0
  * - NEGISHI
    - 0.10.0
  * - SCHOLAR
    - 0.10.0

Commands
~~~~~~
- kneaddata 
- kneaddata_bowtie2_discordant_pairs
- kneaddata_build_database
- kneaddata_database
- kneaddata_read_count_table
- kneaddata_test
- kneaddata_trf_parallel

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load kneaddata 

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run kneaddata on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=kneaddata
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kneaddata
    
    kneaddata --input examples/demo.fastq --reference-db examples/demo_db --output kneaddata_demo_outpu --threads 24 --processes 24
