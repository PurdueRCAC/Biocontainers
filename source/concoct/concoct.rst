.. _backbone-label:  

CONCOCT
============================== 

Introduction
~~~~~~~
``CONCOCT``: Clustering cONtigs with COverage and ComposiTion. 

Detailed usage can be found here: https://github.com/BinPro/CONCOCT

Versions
~~~~~~~~
- 1.1.0-py38

Commands
~~~~~~
- concoct
- concoct_refine
- concoct_coverage_table.py
- cut_up_fasta.py
- extract_fasta_bins.py
- merge_cutup_clustering.py

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load concoct/1.1.0-py38

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run concoct on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=concoct
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers concoct/1.1.0-py38

    cut_up_fasta.py final.contigs.fa -c 10000 -o 0 --merge_last -b contigs_10K.bed > contigs_10K.fa
    concoct_coverage_table.py contigs_10K.bed SRR1976948_sorted.bam > coverage_table.tsv
    concoct --composition_file contigs_10K.fa --coverage_file coverage_table.tsv -b concoct_output/
