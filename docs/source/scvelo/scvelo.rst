.. _backbone-label:  

scVelo
============================== 

Introduction
~~~~~~~
``scVelo`` is a scalable toolkit for RNA velocity analysis in single cells, based on https://doi.org/10.1038/s41587-020-0591-3. Its detailed usage can be found here: https://scvelo.readthedocs.io. 

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.2.4
  * - BELL
    - 0.2.4
  * - GAUTSCHI
    - 0.2.4
  * - NEGISHI
    - 0.2.4
  * - SCHOLAR
    - 0.2.4

Commands
~~~~~~
- python
- python3

Module
~~~~~~~
You can load the modules by::
 
   module load biocontainers  
   module load scvelo/0.2.4

Interactive job
~~~~~~
To run scVelo interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers scvelo/0.2.4
   (base) UserID@bell-a008:~ $ python
   Python 3.9.5 (default, Jun  4 2021, 12:28:51)  
   [GCC 7.5.0] :: Anaconda, Inc. on linux
   Type "help", "copyright", "credits" or "license" for more information.  
   >>> import scvelo as scv
   >>> scv.set_figure_params()
   
Batch job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To submit a sbatch job on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=scvelo
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers scvelo/0.2.4 
   
    python script.py












.. _R202: https://gtdb.ecogenomic.org 
