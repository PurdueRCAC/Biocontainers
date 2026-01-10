.. _backbone-label:

Deepconsensus
==============================

Introduction
~~~~~~~~
DeepConsensus uses gap-aware sequence transformers to correct errors in Pacific Biosciences (PacBio) Circular Consensus Sequencing (CCS) data.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/google/deepconsensus 
| Home page: https://github.com/google/deepconsensus

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
    - 0.2.0
  * - BELL
    - 0.2.0
  * - GAUTSCHI
    - 0.2.0
  * - NEGISHI
    - 0.2.0
  * - SCHOLAR
    - 0.2.0

Commands
~~~~~~~
- deepconsensus
- ccs
- actc

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load deepconsensus

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run deepconsensus on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=deepconsensus
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers deepconsensus
