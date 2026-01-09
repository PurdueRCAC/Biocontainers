.. _backbone-label:  

Velocyto.py
============================== 

Introduction
~~~~~~~
``Velocyto.py`` a library for the analysis of RNA velocity.  

Detailed information about velocyto.py can be found here: https://github.com/velocyto-team/velocyto.py. 

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.17.17
  * - BELL
    - 0.17.17
  * - GAUTSCHI
    - 0.17.17
  * - NEGISHI
    - 0.17.17
  * - SCHOLAR
    - 0.17.17

Commands
~~~~~~
- python
- python3
- velocyto

Module
~~~~~~~
You can load the modules by::
 
   module load biocontainers  
   module load velocyto.py/0.17.17-py39


Interactive job
~~~~~~
To run ``Velocyto.py`` interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers cellrank/1.5.1
   (base) UserID@bell-a008:~ $ python
   Python 3.9.10 |  packaged by conda-forge |  (main, Feb  1 2022, 21:24:11)
   [GCC 9.4.0] :: Anaconda, Inc. on linux
   Type "help", "copyright", "credits" or "license" for more information.  
   >>> import velocyto as vcy
   >>> vlm = vcy.VelocytoLoom("YourData.loom")
   >>> vlm.normalize("S", size=True, log=True)
   >>> vlm.S_norm  # contains log normalized  

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
    #SBATCH --job-name=Velocyto
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers velocyto.py/0.17.17-py39
   
    velocyto run10x cellranger_count_1kpbmcs_out refdata-gex-GRCh38-2020-A/genes/genes.gtf
