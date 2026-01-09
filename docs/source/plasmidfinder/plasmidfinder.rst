.. _backbone-label:

Plasmidfinder
==============================

Introduction
~~~~~~~~
PlasmidFinder identifies plasmids in total or partial sequenced isolates of bacteria.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/plasmidfinder 
| Home page: https://bitbucket.org/genomicepidemiology/plasmidfinder/src/master/

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.1.6
  * - BELL
    - 2.1.6
  * - GAUTSCHI
    - 2.1.6
  * - NEGISHI
    - 2.1.6
  * - SCHOLAR
    - 2.1.6

Commands
~~~~~~~
- plasmidfinder.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load plasmidfinder

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run plasmidfinder on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=plasmidfinder
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers plasmidfinder

    plasmidfinder.py -p test/database \
        -i test/test.fsa -o output -mp blastn -x -q
