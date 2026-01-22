.. _backbone-label:

Htseq
==============================

Introduction
~~~~~~~~
HTSeq is a Python library to facilitate processing and analysis of data from high-throughput sequencing (HTS) experiments.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/htseq 
| Home page: https://github.com/htseq/htseq

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
    - 0.13.5, 1.99.2, 2.0.2-py310, 2.0.1, 2.0.2
  * - BELL
    - 0.13.5, 1.99.2, 2.0.2-py310, 2.0.1, 2.0.2
  * - GAUTSCHI
    - 0.13.5, 1.99.2, 2.0.2-py310, 2.0.1, 2.0.2
  * - NEGISHI
    - 0.13.5, 1.99.2, 2.0.2-py310, 2.0.1, 2.0.2
  * - SCHOLAR
    - 0.13.5, 1.99.2, 2.0.2-py310, 2.0.1, 2.0.2

Commands
~~~~~~~
- htseq-count
- htseq-count-barcodes
- htseq-qa
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load htseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run htseq on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=htseq
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers htseq

        # Your htseq workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=htseq
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers htseq

        # Your htseq workflow...

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
        #SBATCH --job-name=htseq
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers htseq

        # Your htseq workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=htseq
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers htseq

        # Your htseq workflow...
