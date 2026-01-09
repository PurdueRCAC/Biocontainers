.. _backbone-label:

Gtdbtk
==============================

Introduction
~~~~~~~~
GTDB-Tk is a software toolkit for assigning objective taxonomic classifications to bacterial and archaeal genomes based on the Genome Database Taxonomy GTDB. The GTDB-Tk reference data Release R202 was prebuilt with the module.


| For more information, please check:
| DockerHub: https://hub.docker.com/r/ecogenomic/gtdbtk 
| Home page: https://ecogenomics.github.io/GTDBTk/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.7.0
- 2.1.0

Commands
~~~~~~~
- gtdbtk

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gtdbtk

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gtdbtk on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gtdbtk
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gtdbtk

