.. _backbone-label:

Phylosuite
==============================

Introduction
~~~~~~~~
PhyloSuite is an integrated and scalable desktop platform for streamlined molecular sequence data management and evolutionary phylogenetics studies.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/dongzhang0725/phylosuite 
| Home page: https://github.com/dongzhang0725/PhyloSuite

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.2.3

Commands
~~~~~~~
- PhyloSuite.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load phylosuite

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run phylosuite on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=phylosuite
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers phylosuite

