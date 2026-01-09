.. _backbone-label:

Nextflow
==============================

Introduction
~~~~~~~~
``Nextflow`` is a bioinformatics workflow manager that enables the development of portable and reproducible workflows. 

| For more information, please check its website: https://biocontainers.pro/tools/nextflow and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 21.10.0
  * - BELL
    - 21.10.0, 24.10.4
  * - NEGISHI
    - 21.10.0, 24.10.4
  * - SCHOLAR
    - 21.10.0

Commands
~~~~~~~
- nextflow

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load nextflow

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Nextflow on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=nextflow
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers nextflow

.. _Github: https://github.com/nextflow-io/nextflow
