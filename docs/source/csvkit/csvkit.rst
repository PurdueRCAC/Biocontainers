.. _backbone-label:

Csvkit
==============================

Introduction
~~~~~~~~
csvkit is a suite of command-line tools for converting to and working with CSV, the king of tabular file formats.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/johnyaku/csvkit 
| Home page: https://csvkit.readthedocs.io/en/latest/

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.1.1
  * - BELL
    - 1.1.1
  * - GAUTSCHI
    - 1.1.1
  * - NEGISHI
    - 1.1.1
  * - SCHOLAR
    - 1.1.1

Commands
~~~~~~~
- csvclean
- csvcut
- csvformat
- csvgrep
- csvjoin
- csvjson
- csvlook
- csvpy
- csvsort
- csvsql
- csvstack
- csvstat
- in2csv
- sql2csv

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load csvkit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run csvkit on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=csvkit
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers csvkit
