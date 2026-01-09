.. _backbone-label:

Veryfasttree
==============================

Introduction
~~~~~~~~
VeryFastTree is a highly-tuned implementation of the FastTree-2 tool that takes advantage of parallelization and vectorization strategies to speed up the inference of phylogenies for huge alignments. It is important to highlight that VeryFastTree keeps unchanged the phases, methods and heuristics used by FastTree-2 to estimate the phylogenetic tree. In this way, it produces trees with the same topological accuracy than FastTree-2. In addition, unlike the parallel version of FastTree-2, VeryFastTree is deterministic.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/veryfasttree 
| Home page: https://github.com/citiususc/veryfasttree

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 3.2.1

Commands
~~~~~~~
- VeryFastTree

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load veryfasttree

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run veryfasttree on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=veryfasttree
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers veryfasttree

