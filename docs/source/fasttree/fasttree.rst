.. _backbone-label:

Fasttree
==============================

Introduction
~~~~~~~~
FastTree infers approximately-maximum-likelihood phylogenetic trees from alignments of nucleotide or protein sequences. FastTree can handle alignments with up to a million of sequences in a reasonable amount of time and memory. For large alignments, FastTree is 100-1,000 times faster than PhyML 3.0 or RAxML 7.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/fasttree 
| Home page: http://www.microbesonline.org/fasttree/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.1.10
- 2.1.11

Commands
~~~~~~~
- fasttree
- FastTree
- FastTreeMP

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load fasttree

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run fasttree on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fasttree
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fasttree

