.. _backbone-label:

Cnvkit
==============================

Introduction
~~~~~~~~
CNVkit is a command-line toolkit and Python library for detecting copy number variants and alterations genome-wide from high-throughput sequencing.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/cnvkit 
| Home page: https://github.com/etal/cnvkit

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.9.9-py

Commands
~~~~~~~
- cnvkit.py
- cnv_annotate.py
- cnv_expression_correlate.py
- cnv_updater.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cnvkit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cnvkit on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cnvkit
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cnvkit

