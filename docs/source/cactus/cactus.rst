.. _backbone-label:

Cactus
==============================

Introduction
~~~~~~~~
Cactus is a reference-free whole-genome multiple alignment program.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/cactus 
| Home page: https://github.com/ComparativeGenomicsToolkit/cactus

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
    - 2.0.5, 2.2.3-gpu, 2.2.1, 2.2.3, 2.4.0, 2.4.0-gpu, 2.5.2-gpu, 2.5.2, 2.6.5-gpu, 2.6.5
  * - BELL
    - 2.0.5, 2.2.1, 2.2.3, 2.4.0, 2.5.2, 2.6.5
  * - GAUTSCHI
    - 2.0.5, 2.2.1, 2.2.3, 2.4.0, 2.5.2, 2.6.5
  * - GILBRETH
    - 2.2.3-gpu, 2.4.0-gpu
  * - NEGISHI
    - 2.0.5, 2.2.1, 2.2.3, 2.4.0, 2.5.2, 2.6.5
  * - SCHOLAR
    - 2.0.5, 2.2.3-gpu, 2.2.1, 2.2.3, 2.4.0, 2.4.0-gpu, 2.5.2-gpu, 2.5.2, 2.6.5-gpu, 2.6.5

Commands
~~~~~~~
- cactus
- cactus-align
- cactus-align-batch
- cactus-blast
- cactus-graphmap
- cactus-graphmap-join
- cactus-graphmap-split
- cactus-minigraph
- cactus-prepare
- cactus-prepare-toil
- cactus-preprocess
- cactus-refmap
- cactus2hal-stitch.sh
- cactus2hal.py
- cactusAPITests
- cactus_analyseAssembly
- cactus_barTests
- cactus_batch_mergeChunks
- cactus_chain
- cactus_consolidated
- cactus_covered_intervals
- cactus_fasta_fragments.py
- cactus_fasta_softmask_intervals.py
- cactus_filterSmallFastaSequences.py
- cactus_halGeneratorTests
- cactus_local_alignment.py
- cactus_makeAlphaNumericHeaders.py
- cactus_softmask2hardmask

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cactus

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cactus on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=cactus
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers cactus

        # Your cactus workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=cactus
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers cactus

        # Your cactus workflow...

  .. tab-item:: Gautschi-AI or Gilbreth

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p a100        # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=cactus
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers cactus

        # Your cactus workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=cactus
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers cactus

        # Your cactus workflow...
