.. _backbone-label:

Glimmer
==============================

Introduction
~~~~~~~~
Glimmer is system for finding genes in microbial DNA, especially the genomes of bacteria, archaea, and viruses.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/glimmer 
| Home page: http://ccb.jhu.edu/software/glimmer/index.shtml

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
    - 3.02
  * - BELL
    - 3.02
  * - GAUTSCHI
    - 3.02
  * - NEGISHI
    - 3.02
  * - SCHOLAR
    - 3.02

Commands
~~~~~~~
- anomaly
- build-fixed
- build-icm
- entropy-profile
- entropy-score
- extract
- g3-from-scratch.csh
- g3-from-training.csh
- g3-iterated.csh
- get-motif-counts.awk
- glim-diff.awk
- glimmer3
- long-orfs
- match-list-col.awk
- multi-extract
- not-acgt.awk
- score-fixed
- start-codon-distrib
- test
- uncovered
- upstream-coords.awk
- window-acgt

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load glimmer

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run glimmer on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=glimmer
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers glimmer

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=glimmer
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers glimmer

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
        #SBATCH --job-name=glimmer
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers glimmer

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=glimmer
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers glimmer
