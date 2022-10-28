.. _backbone-label:

Links
==============================

Introduction
~~~~~~~~
LINKS is a genomics application for scaffolding genome assemblies with long reads, such as those produced by Oxford Nanopore Technologies Ltd. It can be used to scaffold high-quality draft genome assemblies with any long sequences (eg. ONT reads, PacBio reads, other draft genomes, etc). It is also used to scaffold contig pairs linked by ARCS/ARKS.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/links 
| Home page: https://github.com/bcgsc/LINKS

Versions
~~~~~~~~
- 2.0.1

Commands
~~~~~~~
- LINKS

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load links

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run links on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=links
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers links
