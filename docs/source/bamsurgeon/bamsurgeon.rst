.. _backbone-label:

Bamsurgeon
==============================

Introduction
~~~~~~~~
``Bamsurgeon`` are tools for adding mutations to .bam files, used for testing mutation callers. 

| For more information, please check its | Docker hub: https://hub.docker.com/r/lethalfang/bamsurgeon and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.2
  * - BELL
    - 1.2
  * - GAUTSCHI
    - 1.2
  * - NEGISHI
    - 1.2
  * - SCHOLAR
    - 1.2

Commands
~~~~~~~
- addindel.py
- addsnv.py
- addsv.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bamsurgeon

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bamsurgeon on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bamsurgeon
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bamsurgeon

    addsv.py -p 1 -v test_sv.txt -f testregion_realign.bam \
        -r reference.fasta -o testregion_sv_mut.bam \
        --aligner mem --keepsecondary --seed 1234 \
        --inslib test_inslib.fa
        
.. _Github: https://github.com/adamewing/bamsurgeon
