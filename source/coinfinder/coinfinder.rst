.. _backbone-label:

Coinfinder
==============================

Introduction
~~~~~~~~
Coinfinder is an algorithm and software tool that detects genes which associate and dissociate with other genes more often than expected by chance in pangenomes.
|For more information, please check:
|BioContainers: https://biocontainers.pro/tools/coinfinder 
|Home page: https://github.com/fwhelan/coinfinder

Versions
~~~~~~~~
- 1.2.0

Commands
~~~~~~~
- coinfinder

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load coinfinder

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run coinfinder on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=coinfinder
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers coinfinder

    coinfinder -i coinfinder-manuscript/gene_presence_absence.csv \
        -I -p coinfinder-manuscript/core-gps_fasttree.newick \
        -o output
