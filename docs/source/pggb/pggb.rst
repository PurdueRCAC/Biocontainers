.. _backbone-label:

Pggb
==============================

Introduction
~~~~~~~~
pggb builds pangenome variation graphs from a set of input sequences.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/pangenome/pggb 
| Home page: https://github.com/pangenome/pggb

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.5.4
  * - BELL
    - 0.5.4
  * - GAUTSCHI
    - 0.5.4
  * - NEGISHI
    - 0.5.4
  * - SCHOLAR
    - 0.5.4

Commands
~~~~~~~
- pggb

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pggb

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pggb on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pggb
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pggb
