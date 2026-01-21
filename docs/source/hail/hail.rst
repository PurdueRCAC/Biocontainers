.. _backbone-label:

Hail
==============================

Introduction
~~~~~~~~
Hail is an open-source, general-purpose, Python-based data analysis tool with additional data types and methods for working with genomic data.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/hailgenetics/hail 
| Home page: https://github.com/hail-is/hail

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
    - 0.2.94, 0.2.98
  * - BELL
    - 0.2.94, 0.2.98
  * - GAUTSCHI
    - 0.2.94, 0.2.98
  * - NEGISHI
    - 0.2.94, 0.2.98
  * - SCHOLAR
    - 0.2.94, 0.2.98

Commands
~~~~~~~
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load hail

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run hail on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=hail
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers hail

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=hail
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers hail

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
        #SBATCH --job-name=hail
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers hail

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=hail
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers hail
