.. _backbone-label:

Raxml-ng
==============================

Introduction
~~~~~~~~
Raxml-ng is a phylogenetic tree inference tool which uses maximum-likelihood (ML) optimality criterion.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/raxml-ng 
| Home page: https://github.com/amkozlov/raxml-ng

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
    - 1.1.0
  * - BELL
    - 1.1.0
  * - GAUTSCHI
    - 1.1.0
  * - NEGISHI
    - 1.1.0
  * - SCHOLAR
    - 1.1.0

Commands
~~~~~~~
- raxml-ng
- raxml-ng-mpi
- mpirun
- mpiexec

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load raxml-ng

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run raxml-ng on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=raxml-ng
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers raxml-ng
