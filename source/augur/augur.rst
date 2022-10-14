.. _backbone-label:

Augur
==============================

Introduction
~~~~~~~~
``Augur`` is the bioinformatics toolkit we use to track evolution from sequence and serological data. |For more information, please check its website: https://biocontainers.pro/tools/augur and its home page on `Github`_.

Versions
~~~~~~~~
- 14.0.0
- 15.0.0

Commands
~~~~~~~
- augur

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load augur

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Augur on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=augur
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers augur

    mkdir -p results
    augur index --sequences zika-tutorial/data/sequences.fasta \
                --output results/sequence_index.tsv

    augur filter --sequences zika-tutorial/data/sequences.fasta \
                 --sequence-index results/sequence_index.tsv \
                 --metadata  zika-tutorial/data/metadata.tsv \
                 --exclude zika-tutorial/config/dropped_strains.txt \ 
                 --output results/filtered.fasta \
                 --group-by country year month \
                 --sequences-per-group 20 \
                 --min-date 2012

    augur align --sequences results/filtered.fasta \ 
                --reference-sequence zika-tutorial/config/zika_outgroup.gb \
                --output results/aligned.fasta \
                --fill-gaps

    augur tree --alignment results/aligned.fasta \
               --output results/tree_raw.nwk

    augur refine --tree results/tree_raw.nwk \
                 --alignment results/aligned.fasta \
                 --metadata  zika-tutorial/data/metadata.tsv \
                 --output-tree results/tree.nwk \
                 --output-node-data results/branch_lengths.json \
                 --timetree \
                 --coalescent opt \
                 --date-confidence \
                 --date-inference marginal \
                 --clock-filter-iqd 4


.. _Github: https://github.com/nextstrain/augur
