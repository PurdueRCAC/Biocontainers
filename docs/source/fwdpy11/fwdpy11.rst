.. _backbone-label:

Fwdpy11
==============================

Introduction
~~~~~~~~
Fwdpy11 is a Python package for forward-time population genetic simulation.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/molpopgen/fwdpy11 
| Home page: https://github.com/molpopgen/fwdpy11

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.18.1
  * - BELL
    - 0.18.1
  * - GAUTSCHI
    - 0.18.1
  * - NEGISHI
    - 0.18.1
  * - SCHOLAR
    - 0.18.1

Commands
~~~~~~~
- python3
- python

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load fwdpy11


Interactive job
~~~~~
To run fwdpy11 interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers fwdpy11
   (base) UserID@bell-a008:~ $ python
   Python 3.8.10 (default, Mar 15 2022, 12:22:08) 
   [GCC 9.4.0] on linux
   Type "help", "copyright", "credits" or "license" for more information.  
   >>> import fwdpy11
   >>> pop = fwdpy11.DiploidPopulation(100, 1000.0)
   >>> print(f"N = {pop.N}, L = {pop.tables.genome_length}")

Batch job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run fwdpy11 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fwdpy11
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fwdpy11

    python script.py
