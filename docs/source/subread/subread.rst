.. _backbone-label:

Subread
==============================

Introduction
~~~~~~~~
Subread carries out high-performance read alignment, quantification and mutation discovery. It is a general-purpose read aligner which can be used to map both genomic DNA-seq reads and DNA-seq reads. It uses a new mapping paradigm called seed-and-vote to achieve fast, accurate and scalable read mapping. Subread automatically determines if a read should be globally or locally aligned, therefore particularly powerful in mapping RNA-seq reads. It supports INDEL detection and can map reads with both fixed and variable lengths.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/subread 
| Home page: http://subread.sourceforge.net

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
    - 1.6.4, 2.0.1, 2.1.1
  * - BELL
    - 1.6.4, 2.0.1
  * - GAUTSCHI
    - 1.6.4, 2.0.1
  * - NEGISHI
    - 1.6.4, 2.0.1
  * - SCHOLAR
    - 1.6.4, 2.0.1

Commands
~~~~~~~
- detectionCall
- exactSNP
- featureCounts
- flattenGTF
- genRandomReads
- propmapped
- qualityScores
- removeDup
- repair
- subindel
- subjunc
- sublong
- subread-align
- subread-buildindex
- subread-fullscan
- txUnique

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load subread

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run subread on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=subread
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers subread

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=subread
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers subread

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
        #SBATCH --job-name=subread
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers subread

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=subread
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers subread
