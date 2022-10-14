.. _backbone-label:

Paml
==============================

Introduction
~~~~~~~~
``Paml`` is a package of programs for phylogenetic analyses of DNA or protein sequences using maximum likelihood. | For more information, please check its website: https://biocontainers.pro/tools/paml and its home page: http://abacus.gene.ucl.ac.uk/software/paml.html.

Versions
~~~~~~~~
- 4.9

Commands
~~~~~~~
- baseml
- basemlg
- chi2
- codeml
- evolver
- infinitesites
- mcmctree
- pamp
- yn00

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load paml

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Paml on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=paml
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers paml
