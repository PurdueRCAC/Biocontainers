.. _backbone-label:

Abacas
==============================

Introduction
~~~~~~~~
``Abacas`` is a tool for algorithm based automatic contiguation of assembled sequences. 


| For more information, please check its website: https://biocontainers.pro/tools/abacas and its home page: http://abacas.sourceforge.net.

Versions
~~~~~~~~
==========  ==========
Cluster     Versions
==========  ==========
**SCHOLAR**  1.3.1
**NEGISHI**  1.3.1
**BELL**  1.3.1
**ANVIL**  1.3.1
**GAUTSCHI**  1.3.1
==========  ==========

Commands
~~~~~~~
- abacas.pl
- abacas.1.3.1.pl

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load abacas

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Abacas on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=abacas
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers abacas
   
    abacas.pl -r cmm.fasta -q Cm.contigs.fasta -p nucmer -o out_prefix
