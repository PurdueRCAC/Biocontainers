.. _backbone-label:

Plotsr
==============================

Introduction
~~~~~~~~
Plotsr generates high-quality visualisation of synteny and structural rearrangements between multiple genomes. For this, it uses the genomic structural annotations between multiple chromosome-level assemblies.

| For more information, please check:
| Home page: https://github.com/schneebergerlab/plotsr

Versions
~~~~~~~~
- 0.5.4

Commands
~~~~~~~
- plotsr

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load plotsr

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run plotsr on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=plotsr
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers plotsr

    plotsr syri.out refgenome qrygenome -H 8 -W 5
