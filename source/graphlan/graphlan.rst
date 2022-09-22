.. _backbone-label:

Graphlan
==============================

Introduction
~~~~~~~~
``Graphlan`` is a software tool for producing high-quality circular representations of taxonomic and phylogenetic trees. For more information, please check its website: https://biocontainers.pro/tools/graphlan and its home page: https://huttenhower.sph.harvard.edu/graphlan/.

Versions
~~~~~~~~
- 1.1.3

Commands
~~~~~~~
- graphlan.py
- graphlan_annotate.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load graphlan

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Graphlan on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=graphlan
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers graphlan

    graphlan_annotate.py hmptree.xml hmptree.annot.xml --annot annot.txt
    
    graphlan.py hmptree.annot.xml hmptree.png --dpi 150 --size 14
