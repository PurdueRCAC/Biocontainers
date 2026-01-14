.. _backbone-label:

Abacas
==============================

Introduction
~~~~~~~~
Abacas is a tool for algorithm based automatic contiguation of assembled sequences.


| For more information, please check:
| Home page: http://abacas.sourceforge.net

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

  * - BELL
    - 1.3.1
  * - GAUTSCHI
    - 1.3.1
  * - NEGISHI
    - 1.3.1
  * - SCHOLAR
    - 1.3.1

Commands
~~~~~~~
- abacas.pl
- abacas.1.3.1.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load abacas

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run abacas on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=abacas
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers abacas
