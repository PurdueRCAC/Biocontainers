.. _backbone-label:

Staramr
==============================

Introduction
~~~~~~~~
staramr scans bacterial genome contigs against the ResFinder, PointFinder, and PlasmidFinder databases (used by the ResFinder webservice and other webservices offered by the Center for Genomic Epidemiology) and compiles a summary report of detected antimicrobial resistance genes.
| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/staramr 
| Home page: https://github.com/phac-nml/staramr

Versions
~~~~~~~~
- 0.7.1

Commands
~~~~~~~
- staramr

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load staramr

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run staramr on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=staramr
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers staramr

    staramr db info
    staramr search \ 
        --pointfinder-organism salmonella \
        -o out *.fasta
