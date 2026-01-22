.. _backbone-label:

Homopolish
==============================

Introduction
~~~~~~~~
Homopolish is a genome polisher originally developed for Nanopore and subsequently extended for PacBio CLR. It generates a high-quality genome (>Q50) for virus, bacteria, and fungus. Nanopore/PacBio systematic errors are corrected by retreiving homologs from closely-related genomes and polished by an SVM. When paired with Racon and Medaka, the genome quality can reach Q50-90 (>99.999%) on Nanopore R9.4/10.3 flowcells (Guppy >3.4). For PacBio CLR, Homopolish also improves the majority of Flye-assembled genomes to Q90.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/homopolish 
| Home page: https://github.com/ythuang0522/homopolish

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
    - 0.4.1
  * - BELL
    - 0.4.1
  * - GAUTSCHI
    - 0.4.1
  * - NEGISHI
    - 0.4.1
  * - SCHOLAR
    - 0.4.1

Commands
~~~~~~~
- homopolish

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load homopolish

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run homopolish on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=homopolish
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers homopolish

        # Your homopolish workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=homopolish
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers homopolish

        # Your homopolish workflow...

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
        #SBATCH --job-name=homopolish
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers homopolish

        # Your homopolish workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=homopolish
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers homopolish

        # Your homopolish workflow...
