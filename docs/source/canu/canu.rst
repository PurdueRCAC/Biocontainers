.. _backbone-label:  

Canu
============================== 

Introduction
~~~~~~~
``Canu`` is a single molecule sequence assembler for genomes large and small.

Detailed usage can be found here: https://github.com/marbl/canu

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.1.1, 2.2
  * - BELL
    - 2.1.1, 2.2
  * - GAUTSCHI
    - 2.1.1, 2.2
  * - NEGISHI
    - 2.1.1, 2.2
  * - SCHOLAR
    - 2.1.1, 2.2

Commands
~~~~~~
- canu

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load canu/2.2

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run canu on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=canu
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers canu/2.2
    
    canu -p Cm -d clavibacter_pacbio genomeSize=3.4m  -pacbio *.fastq
