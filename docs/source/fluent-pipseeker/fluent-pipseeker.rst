.. _backbone-label:

Fluent-pipseeker
==============================

Introduction
~~~~~~~~
PIPseeker analyzes single-cell data obtained with Fluent BioSciences proprietary PIPseq V 3ʹ Single Cell RNA (scRNA-seq) Kits


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/fluent-pipseeker 
| Home page: https://www.fluentbio.com/resources/pipseeker-downloads/

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - BELL
    - 3.3.0
  * - NEGISHI
    - 3.3.0

Commands
~~~~~~~
- pipseeker

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load fluent-pipseeker

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run fluent-pipseeker on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fluent-pipseeker
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fluent-pipseeker
