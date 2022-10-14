.. _backbone-label:

Kaiju
==============================

Introduction
~~~~~~~~
``Kaiju`` is a tool for fast taxonomic classification of metagenomic sequencing reads using a protein reference database. 
| For more information, please check its website: https://biocontainers.pro/tools/kaiju and its home page on `Github`_.

Versions
~~~~~~~~
- 1.8.2

Commands
~~~~~~~
- kaiju
- kaiju-addTaxonNames
- kaiju-convertMAR.py
- kaiju-convertNR
- kaiju-excluded-accessions.txt
- kaiju-gbk2faa.pl
- kaiju-makedb
- kaiju-mergeOutputs
- kaiju-mkbwt
- kaiju-mkfmi
- kaiju-multi
- kaiju-taxonlistEuk.tsv
- kaiju2krona
- kaiju2table
- kaijup
- kaijux

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load kaiju

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Kaiju on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=kaiju
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kaiju

    kaiju -t kaijudb/nodes.dmp \
         -f kaijudb/refseq/kaiju_db_refseq.fmi \
        -i input_1.fastq -j input_2.fastq
         -z 24
.. _Github: https://github.com/bioinformatics-centre/kaiju
