.. _backbone-label:

Gubbins
==============================

Introduction
~~~~~~~~
``Gubbins`` is an algorithm that iteratively identifies loci containing elevated densities of base substitutions while concurrently constructing a phylogeny based on the putative point mutations outside of these regions. | For more information, please check its website: https://biocontainers.pro/tools/gubbins and its home page on `Github`_.

Versions
~~~~~~~~
- 3.2.0-py39

Commands
~~~~~~~
- extract_gubbins_clade.py
- generate_ska_alignment.py
- gubbins_alignment_checker.py
- mask_gubbins_aln.py
- run_gubbins.py
- sumlabels.py
- sumtrees.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load gubbins

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Gubbins on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gubbins
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gubbins

    run_gubbins.py --prefix ST239 ST239.aln 
.. _Github: https://github.com/nickjcroucher/gubbins
