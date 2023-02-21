.. _backbone-label:

Kissplice2refgenome
==============================

Introduction
~~~~~~~~
KisSplice can also be used when a reference (annotated) genome is available, in order to annotate the variants found and help prioritize cases to validate experimentally. In this case, the results of KisSplice are mapped to the reference genome, using for instance STAR, and the mapping results are analysed using KisSplice2RefGenome.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/dwishsan/kissplice-pipeline 
| Home page: https://kissplice.prabi.fr

Versions
~~~~~~~~
- 2.0.8

Commands
~~~~~~~
- kissplice2refgenome

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load kissplice2refgenome

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run kissplice2refgenome on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=kissplice2refgenome
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kissplice2refgenome
