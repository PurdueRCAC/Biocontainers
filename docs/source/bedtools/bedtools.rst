.. _backbone-label:

Bedtools
==============================

Introduction
~~~~~~~~
Bedtools is an extensive suite of utilities for genome arithmetic and comparing genomic features in BED format.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bedtools 
| Home page: https://github.com/arq5x/bedtools2

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.30.0, 2.31.0
  * - BELL
    - 2.30.0, 2.31.0
  * - GAUTSCHI
    - 2.30.0, 2.31.0
  * - NEGISHI
    - 2.30.0, 2.31.0
  * - SCHOLAR
    - 2.30.0, 2.31.0

Commands
~~~~~~~
- annotateBed
- bamToBed
- bamToFastq
- bed12ToBed6
- bedpeToBam
- bedToBam
- bedToIgv
- bedtools
- closestBed
- clusterBed
- complementBed
- coverageBed
- expandCols
- fastaFromBed
- flankBed
- genomeCoverageBed
- getOverlap
- groupBy
- intersectBed
- linksBed
- mapBed
- maskFastaFromBed
- mergeBed
- multiBamCov
- multiIntersectBed
- nucBed
- pairToBed
- pairToPair
- randomBed
- shiftBed
- shuffleBed
- slopBed
- sortBed
- subtractBed
- tagBam
- unionBedGraphs
- windowBed
- windowMaker

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bedtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bedtools on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=bedtools
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bedtools

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=bedtools
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bedtools

   .. tab-item:: Gautschi-AI/Gilbreth

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p a100        # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=bedtools
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bedtools

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=bedtools
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bedtools
