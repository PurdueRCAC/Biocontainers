.. _backbone-label:

Pbptyper
==============================

Introduction
~~~~~~~~
pbptyper is a tool to identify the Penicillin Binding Protein (PBP) of Streptococcus pneumoniae assemblies.
| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/pbptyper 
| Home page: https://github.com/rpetit3/pbptyper

Versions
~~~~~~~~
- 1.0.4

Commands
~~~~~~~
- pbptyper

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pbptyper

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pbptyper on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pbptyper
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pbptyper

    pbptyper --assembly test/SRR2912551.fna.gz --outdir output
