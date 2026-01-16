.. _backbone-label:

Seqyclean
==============================

Introduction
~~~~~~~~
Seqyclean is used to pre-process NGS data in order to prepare for downstream analysis.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/seqyclean 
| Home page: https://github.com/ibest/seqyclean

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.10.09
  * - BELL
    - 1.10.09
  * - GAUTSCHI
    - 1.10.09
  * - NEGISHI
    - 1.10.09
  * - SCHOLAR
    - 1.10.09

Commands
~~~~~~~
- seqyclean

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load seqyclean

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run seqyclean on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=seqyclean
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers seqyclean
