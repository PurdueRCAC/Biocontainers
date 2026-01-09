.. _backbone-label:  

ANGSD
============================== 

Introduction
~~~~~~~
``ANGSD`` is a software for analyzing next generation sequencing data. Detailed usage can be found here: http://www.popgen.dk/angsd/index.php/ANGSD. 

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.935, 0.937, 0.939, 0.940
  * - BELL
    - 0.935, 0.937, 0.939, 0.940
  * - GAUTSCHI
    - 0.935, 0.937, 0.939, 0.940
  * - NEGISHI
    - 0.935, 0.937, 0.939, 0.940
  * - SCHOLAR
    - 0.935, 0.937, 0.939, 0.940

Commands
~~~~~~
- angsd
- realSFS
- msToGlf
- thetaStat
- supersim

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load angsd/0.937

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run angsd on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=angsd
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers angsd/0.937
    
    angsd -b bam.filelist -GL 1 -doMajorMinor 1 -doMaf 2 -P 5 -minMapQ 30 -minQ 20 -minMaf 0.05
