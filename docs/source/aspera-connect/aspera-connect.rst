.. _backbone-label:

Aspera-connect
==============================

Introduction
~~~~~~~~
Aspera Connect is software that allows download and upload data. The software includes a command line tool (ascp) that allows scripted data transfer.


| For more information, please check:
|

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 4.2.6
  * - BELL
    - 4.2.6
  * - GAUTSCHI
    - 4.2.6
  * - NEGISHI
    - 4.2.6
  * - SCHOLAR
    - 4.2.6

Commands
~~~~~~~
- ascp
- ascp4
- asperaconnect
- asperaconnect.bin
- asperaconnect-nmh
- asperacrypt
- asunprotect

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load aspera-connect

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run aspera-connect on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=aspera-connect
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers aspera-connect
