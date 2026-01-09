.. _backbone-label:  

CellRank-krylov
============================== 

.. image:: ../../images/cellrank.png
   :width: 300px
   :align: center
   
Introduction
~~~~~~~
``CellRank`` a toolkit to uncover cellular dynamics based on Markov state modeling of single-cell data. ``CellRank-krylov`` is ``CellRank`` installed with extra libraries, enabling it to have better performance for large datasets (>15k cells). 
Detailed information about CellRank can be found here: https://cellrank.readthedocs.io/en/stable/. 

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.5.1
  * - BELL
    - 1.5.1
  * - GAUTSCHI
    - 1.5.1
  * - NEGISHI
    - 1.5.1
  * - SCHOLAR
    - 1.5.1

Commands
~~~~~~
- python
- python3

Module
~~~~~~~
You can load the modules by::
 
   module load biocontainers  
   module load cellrank-krylov/1.5.1

.. note::
   The CellRank container also contained scVelo and scanpy. When you want to use CellRank, do not load scVelo or scanpy. 

Interactive job
~~~~~~
To run CellRank-krylov interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers cellrank-krylov/1.5.1
   (base) UserID@bell-a008:~ $ python
   Python 3.9.9 |  packaged by conda-forge |  (main, Dec 20 2021, 02:41:03)
   [GCC 9.4.0] :: Anaconda, Inc. on linux
   Type "help", "copyright", "credits" or "license" for more information.  
   >>> import scanpy as sc
   >>> import scvelo as scv
   >>> import cellrank as cr
   >>> import numpy as np
   >>> scv.settings.verbosity = 3
   >>> scv.settings.set_figure_params("scvelo")
   >>> cr.settings.verbosity = 2
   
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
    #SBATCH --job-name=cellrank-krylov
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cellrank-krylov/1.5.1
   
    python script.py
