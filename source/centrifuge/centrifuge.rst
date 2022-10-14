.. _backbone-label:

Centrifuge
==============================

Introduction
~~~~~~~~
``Centrifuge`` is a novel microbial classification engine that enables rapid, accurate, and sensitive labeling of reads and quantification of species on desktop computers. 

| For more information, please check its website: https://biocontainers.pro/tools/centrifuge and its home page: http://www.ccb.jhu.edu/software/centrifuge/.

Versions
~~~~~~~~
- 1.0.4_beta

Commands
~~~~~~~
- centrifuge
- centrifuge-BuildSharedSequence.pl
- centrifuge-RemoveEmptySequence.pl
- centrifuge-RemoveN.pl
- centrifuge-build
- centrifuge-build-bin
- centrifuge-class
- centrifuge-compress.pl
- centrifuge-download
- centrifuge-inspect
- centrifuge-inspect-bin
- centrifuge-kreport
- centrifuge-sort-nt.pl
- centrifuge_evaluate.py
- centrifuge_simulate_reads.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load centrifuge

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Centrifuge on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=centrifuge
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers centrifuge

    centrifuge-download -o taxonomy taxonomy
    centrifuge-download -o library -m -d "archaea,bacteria,viral" refseq > seqid2taxid.map
    cat library/*/*.fna > input-sequences.fna
    centrifuge-build -p 8 --conversion-table seqid2taxid.map \
                 --taxonomy-tree taxonomy/nodes.dmp --name-table taxonomy/names.dmp \
                 input-sequences.fna abv
