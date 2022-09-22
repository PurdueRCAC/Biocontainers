.. _backbone-label:

Dsuite
==============================

Introduction
~~~~~~~~
``Dsuite`` is a fast C++ implementation, allowing genome scale calculations of the D and f4-ratio statistics across all combinations of tens or hundreds of populations or species directly from a variant call format (VCF) file. For more information, please check its home page on `Github`_.

Versions
~~~~~~~~
- 0.4.r43
- 0.5.r44

Commands
~~~~~~~
- Dsuite
- dtools.py
- DtriosParallel

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load dsuite

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Dsuite on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=dsuite
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers dsuite

    Dsuite Dtrios -c -n no_geneflow -t simulated_tree_no_geneflow.nwk chr1_no_geneflow.vcf.gz species_sets.txt 

.. _Github: https://github.com/millanek/Dsuite
