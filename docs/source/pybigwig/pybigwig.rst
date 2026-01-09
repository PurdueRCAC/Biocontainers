.. _backbone-label:

Pybigwig
==============================

Introduction
~~~~~~~~
``Pybigwig`` is a python extension, written in C, for quick access to bigBed files and access to and creation of bigWig files. 

| For more information, please check its website: https://biocontainers.pro/tools/pybigwig and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.3.18
  * - BELL
    - 0.3.18
  * - GAUTSCHI
    - 0.3.18
  * - NEGISHI
    - 0.3.18
  * - SCHOLAR
    - 0.3.18

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load pybigwig

Interactive job
~~~~~~
To run pybigwig interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers pybigwig
   (base) UserID@bell-a008:~ $ python
   Python 3.6.15 |  packaged by conda-forge |  (default, Dec  3 2021, 18:49:41)  
   [GCC 9.4.0] on linux
   Type "help", "copyright", "credits" or "license" for more information.  
   >>> import pyBigWig
   >>> bw = pyBigWig.open("test/test.bw")

Batch job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run batch jobs on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pybigwig
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pybigwig
    
    python script.py
.. _Github: https://github.com/deeptools/pyBigWig
