.. _backbone-label:

Gatk4
==============================

Introduction
~~~~~~~~
GATK (Genome Analysis Toolkit) is a collection of command-line tools for analyzing high-throughput sequencing data with a primary focus on variant discovery.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gatk4 
| Home page: https://www.broadinstitute.org/gatk/

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
    - 4.2.0, 4.2.5.0, 4.2.6.1, 4.3.0.0, 4.6.0.0
  * - BELL
    - 4.2.0, 4.2.5.0, 4.2.6.1, 4.3.0.0, 4.6.0.0
  * - GAUTSCHI
    - 4.2.0, 4.2.5.0, 4.2.6.1, 4.3.0.0, 4.6.0.0
  * - NEGISHI
    - 4.2.0, 4.2.5.0, 4.2.6.1, 4.3.0.0, 4.6.0.0
  * - SCHOLAR
    - 4.2.0, 4.2.5.0, 4.2.6.1, 4.3.0.0

Commands
~~~~~~~
- gatk

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gatk4

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gatk4 on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=gatk4
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers gatk4

        # Your gatk4 workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=gatk4
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers gatk4

        # Your gatk4 workflow...

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
        #SBATCH --job-name=gatk4
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers gatk4

        # Your gatk4 workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=gatk4
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers gatk4

        # Your gatk4 workflow...
