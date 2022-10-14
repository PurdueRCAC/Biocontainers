.. _backbone-label:

Sepp
==============================

Introduction
~~~~~~~~
``Sepp`` stands for SATé-Enabled Phylogenetic Placement and addresses the problem of phylogenetic placement for meta-genomic short reads. 
| For more information, please check its website: https://biocontainers.pro/tools/sepp and its home page on `Github`_.

Versions
~~~~~~~~
- 4.5.1-py37

Commands
~~~~~~~
- run_sepp.py
- run_upp.py
- split_sequences.py
- sumlabels.py
- sumtrees.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load sepp

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Sepp on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=sepp
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers sepp

    run_sepp.py -t mock/rpsS/sate.tre \
        -r mock/rpsS/sate.tre.RAxML_info \
        -a mock/rpsS/sate.fasta \
        -f mock/rpsS/rpsS.even.fas \
        -o rpsS.out.default
.. _Github: https://github.com/smirarab/sepp
