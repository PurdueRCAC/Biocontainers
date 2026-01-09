.. _backbone-label:

Souporcell
==============================

Introduction
~~~~~~~~
souporcell is a method for clustering mixed-genotype scRNAseq experiments by individual.


| For more information, please check:
| Home page: https://github.com/wheaton5/souporcell

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.0

Commands
~~~~~~~
- check_modules.py
- compile_stan_model.py
- consensus.py
- renamer.py
- retag.py
- shared_samples.py
- souporcell.py
- souporcell_pipeline.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load souporcell

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run souporcell on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=souporcell
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers souporcell

