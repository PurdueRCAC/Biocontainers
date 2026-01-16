.. _backbone-label:

Momi
==============================

Introduction
~~~~~~~~
momi (MOran Models for Inference) is a Python package that computes the expected sample frequency spectrum (SFS), a statistic commonly used in population genetics, and uses it to fit demographic history.


| For more information, please check:
| Home page: https://momi2.readthedocs.io/en/latest/

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
    - 2.1.19
  * - BELL
    - 2.1.19
  * - GAUTSCHI
    - 2.1.19
  * - NEGISHI
    - 2.1.19
  * - SCHOLAR
    - 2.1.19

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load momi

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run momi on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=momi
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers momi
