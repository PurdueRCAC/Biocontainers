.. _backbone-label:

Genemarks-2
==============================

Introduction
~~~~~~~~
GeneMarkS-2 combines GeneMark.hmm (prokaryotic) and GeneMark (prokaryotic) with a self-training procedure that determines parameters of the models of both GeneMark.hmm and GeneMark.

| For more information, please check:
The users need to download your own licence key from GeneMark website and copy key "gm_key" into users' home directory as: cp gm_key ~/.gm_key | Home page: http://opal.biology.gatech.edu/GeneMark/

Versions
~~~~~~~~
- 1.14_1.25

Commands
~~~~~~~
- gms2.pl
- biogem
- compp
- gmhmmp2

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load genemarks-2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run genemarks-2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=genemarks-2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers genemarks-2
