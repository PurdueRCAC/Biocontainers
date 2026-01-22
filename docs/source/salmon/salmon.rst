.. _backbone-label:

Salmon
==============================

Introduction
~~~~~~~~
Salmon is a tool for quantifying the expression of transcripts using RNA-seq data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/salmon 
| Home page: https://combine-lab.github.io/salmon/

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
    - 1.5.2, 1.6.0, 1.7.0, 1.8.0, 1.9.0, 1.10.1
  * - BELL
    - 1.5.2, 1.6.0, 1.7.0, 1.8.0, 1.9.0, 1.10.1
  * - GAUTSCHI
    - 1.5.2, 1.6.0, 1.7.0, 1.8.0, 1.9.0, 1.10.1
  * - NEGISHI
    - 1.5.2, 1.6.0, 1.7.0, 1.8.0, 1.9.0, 1.10.1
  * - SCHOLAR
    - 1.5.2, 1.6.0, 1.7.0, 1.8.0, 1.9.0, 1.10.1

Commands
~~~~~~~
- salmon

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load salmon

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run salmon on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=salmon
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers salmon

        # Your salmon workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=salmon
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers salmon

        # Your salmon workflow...

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
        #SBATCH --job-name=salmon
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers salmon

        # Your salmon workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=salmon
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers salmon

        # Your salmon workflow...
