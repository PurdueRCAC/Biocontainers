.. _backbone-label:

Getorganelle
==============================

Introduction
~~~~~~~~
GetOrganelle: a fast and versatile toolkit for accurate de novo assembly of organelle genomes.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/getorganelle 
| Home page: https://github.com/Kinggerm/GetOrganelle

Versions
~~~~~~~~
- 1.7.7.0

Commands
~~~~~~~
- get_organelle_config.py
- get_organelle_from_assembly.py
- get_organelle_from_reads.py
- slim_graph.py
- summary_get_organelle_output.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load getorganelle

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run getorganelle on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=getorganelle
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers getorganelle
