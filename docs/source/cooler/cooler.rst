.. _backbone-label:

.. image:: https://github.com/open2c/cooler/raw/master/docs/cooler_logo.png
  :width: 200
  :alt: Alternative text
Cooler
==============================

Introduction
~~~~~~~~
``Cooler`` is a support library for a sparse, compressed, binary persistent storage format, also called cooler, used to store genomic interaction data, such as Hi-C contact matrices. 

| For more information, please check its website: https://biocontainers.pro/tools/cooler and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.8.11
  * - BELL
    - 0.8.11
  * - GAUTSCHI
    - 0.8.11
  * - NEGISHI
    - 0.8.11
  * - SCHOLAR
    - 0.8.11

Commands
~~~~~~~
- cooler
- python
- python3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load Cooler

Interactive job
~~~~~
To run Cooler interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers cooler
   (base) UserID@bell-a008:~ $ python
   Python 3.9.7 |  packaged by conda-forge |  (default, Sep 29 2021, 19:20:46) 
   [GCC 9.4.0] on linux
   Type "help", "copyright", "credits" or "license" for more information.  
   >>> import cooler

Batch job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Cooler batch jobs on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cooler
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cooler
    
    cooler info data/Rao2014-GM12878-MboI-allreps-filtered.1000kb.cool
    cooler info -f bin-size data/Rao2014-GM12878-MboI-allreps-filtered.1000kb.cool
    cooler info -m data/Rao2014-GM12878-MboI-allreps-filtered.1000kb.cool
    cooler tree data/Rao2014-GM12878-MboI-allreps-filtered.1000kb.cool
    cooler attrs data/Rao2014-GM12878-MboI-allreps-filtered.1000kb.cool
.. _Github: https://github.com/open2c/cooler
