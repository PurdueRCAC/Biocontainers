.. _backbone-label:

Sra-tools
==============================

Introduction
~~~~~~~~
The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/sra-tools 
| Home page: https://github.com/ncbi/sra-tools

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
    - 2.11.0-pl5262
  * - BELL
    - 2.11.0-pl5262
  * - GAUTSCHI
    - 2.11.0-pl5262
  * - NEGISHI
    - 2.11.0-pl5262
  * - SCHOLAR
    - 2.11.0-pl5262

Commands
~~~~~~~
- abi-dump
- align-cache
- align-info
- bam-load
- cache-mgr
- cg-load
- fasterq-dump
- fasterq-dump-orig
- fastq-dump
- fastq-dump-orig
- illumina-dump
- kar
- kdbmeta
- kget
- latf-load
- md5cp
- prefetch
- prefetch-orig
- rcexplain
- read-filter-redact
- sam-dump
- sam-dump-orig
- sff-dump
- sra-pileup
- sra-pileup-orig
- sra-sort
- sra-sort-cg
- sra-stat
- srapath
- srapath-orig
- sratools
- test-sra
- vdb-config
- vdb-copy
- vdb-diff
- vdb-dump
- vdb-encrypt
- vdb-lock
- vdb-passwd
- vdb-unlock
- vdb-validate

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load sra-tools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run sra-tools on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=sra-tools
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers sra-tools

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=sra-tools
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers sra-tools

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
        #SBATCH --job-name=sra-tools
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers sra-tools

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=sra-tools
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers sra-tools
