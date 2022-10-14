.. _backbone-label:

Transvar
==============================

Introduction
~~~~~~~~
``Transvar`` is a multi-way annotator for genetic elements and genetic variations. | For more information, please check its | Docker hub: https://hub.docker.com/r/zhouwanding/transvar and its home page: https://bioinformatics.mdanderson.org/public-software/transvar/.

Versions
~~~~~~~~
- 2.5.9

Commands
~~~~~~~
- transvar

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load transvar

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Transvar on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=transvar
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers transvar

    # set up databases
    transvar config --download_anno --refversion hg19

    # in case you don't have a reference
    transvar config --download_ref --refversion hg19

    transvar panno -i 'PIK3CA:p.E545K' --ucsc --ccds
