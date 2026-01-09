.. _backbone-label:  

FastTree
============================== 

Introduction
~~~~~~~ 
``FastTree`` infers approximately-maximum-likelihood phylogenetic trees from alignments of nucleotide or protein sequences. FastTree can handle alignments with up to a million of sequences in a reasonable amount of time and memory.  

Detailed usage can be found here: http://www.microbesonline.org/fasttree/


Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.1.10, 2.1.11
  * - BELL
    - 2.1.10, 2.1.11
  * - GAUTSCHI
    - 2.1.10, 2.1.11
  * - NEGISHI
    - 2.1.10, 2.1.11
  * - SCHOLAR
    - 2.1.10, 2.1.11

Commands
~~~~~~
- fasttree
- FastTree
- FastTreeMP

.. note::
   ``fasttree`` and ``FastTree`` are the same program, and they only support one CPU. If you want to use multiple CPUs, please use ``FastTreeMP`` and also set the ``OMP_NUM_THREADS`` to the number of cores you requested. 

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load fasttree

Example job using single CPU
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run FastTree on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fasttree
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fasttree
    
    FastTree alignmentfile > treefile

Example job using multiple CPUs
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run FastTree on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=FastTreeMP
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fasttree
    
    export OMP_NUM_THREADS=24

    FastTreeMP alignmentfile > treefile
