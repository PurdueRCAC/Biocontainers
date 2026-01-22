.. _backbone-label:

Abyss
==============================

Introduction
~~~~~~~~
ABySS is a de novo sequence assembler intended for short paired-end reads and genomes of all sizes.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/abyss 
| Home page: https://github.com/bcgsc/abyss/

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
    - 2.3.2, 2.3.4, 2.3.8
  * - BELL
    - 2.3.2, 2.3.4, 2.3.8
  * - GAUTSCHI
    - 2.3.2, 2.3.4, 2.3.8
  * - NEGISHI
    - 2.3.2, 2.3.4, 2.3.8
  * - SCHOLAR
    - 2.3.2, 2.3.4

Commands
~~~~~~~
- ABYSS
- ABYSS-P
- AdjList
- Consensus
- DAssembler
- DistanceEst
- DistanceEst-ssq
- KAligner
- MergeContigs
- MergePaths
- Overlap
- ParseAligns
- PathConsensus
- PathOverlap
- PopBubbles
- SimpleGraph
- abyss-align
- abyss-bloom
- abyss-bloom-dbg
- abyss-bowtie
- abyss-bowtie2
- abyss-bwa
- abyss-bwamem
- abyss-bwasw
- abyss-db-txt
- abyss-dida
- abyss-fac
- abyss-fatoagp
- abyss-filtergraph
- abyss-fixmate
- abyss-fixmate-ssq
- abyss-gapfill
- abyss-gc
- abyss-index
- abyss-junction
- abyss-kaligner
- abyss-layout
- abyss-longseqdist
- abyss-map
- abyss-map-ssq
- abyss-mergepairs
- abyss-overlap
- abyss-paired-dbg
- abyss-paired-dbg-mpi
- abyss-pe
- abyss-rresolver-short
- abyss-samtoafg
- abyss-scaffold
- abyss-sealer
- abyss-stack-size
- abyss-tabtomd
- abyss-todot
- abyss-tofastq
- konnector
- logcounter

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load abyss

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run abyss on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=abyss
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers abyss

        # Your abyss workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=abyss
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers abyss

        # Your abyss workflow...

  .. tab-item:: Gautschi-AI

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p ai          # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=abyss
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers abyss

        # Your abyss workflow...

  .. tab-item:: Gilbreth

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p a100        # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH --mem=2G       # Memory
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=abyss
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers abyss

        # Your abyss workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=abyss
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers abyss

        # Your abyss workflow...
