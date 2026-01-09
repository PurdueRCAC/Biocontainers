.. _backbone-label:  

Scanpy
============================== 

Introduction
~~~~~~~
``Scanpy`` is scalable toolkit for analyzing single-cell gene expression data. It includes preprocessing, visualization, clustering, pseudotime and trajectory inference and differential expression testing. The Python-based implementation efficiently deals with datasets of more than one million cells. Details about its usage can be found here (https://scanpy.readthedocs.io/en/stable/)

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.8.2, 1.9.1
  * - BELL
    - 1.8.2, 1.9.1
  * - GAUTSCHI
    - 1.8.2, 1.9.1
  * - NEGISHI
    - 1.8.2, 1.9.1
  * - SCHOLAR
    - 1.8.2, 1.9.1

Commands
~~~~~~
- python
- python3

Module
~~~~~~~
You can load the modules by::
 
   module load biocontainers  
   module load scanpy/1.8.2

Interactive job
~~~~~~
To run scanpy interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers scanpy/1.8.2
   (base) UserID@bell-a008:~ $ python
   Python 3.9.5 (default, Jun  4 2021, 12:28:51)  
   [GCC 7.5.0] :: Anaconda, Inc. on linux
   Type "help", "copyright", "credits" or "license" for more information.  
   >>> import scanpy as sc
   >>> sc.tl.umap(adata, **tool_params)
   
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
    #SBATCH --job-name=scanpy
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers scanpy/1.8.2 
   
    python script.py












.. _R202: https://gtdb.ecogenomic.org 
