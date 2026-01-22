.. _backbone-label:

Alphafold
==============================

Introduction
~~~~~~~~
Alphafold is an artificial intelligence program developed by Alphabets's/Google's DeepMind which performs predictions of protein structure.


| For more information, please check:
| Home page: https://github.com/deepmind/alphafold

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
    - 2.1.1, 2.2.0, 2.2.3, 2.3.0, 2.3.1
  * - BELL
    - 2.1.1, 2.2.0, 2.2.3, 2.3.0, 2.3.1
  * - GAUTSCHI
    - 2.1.1, 2.2.0, 2.2.3, 2.3.0, 2.3.1, 3.0.1
  * - GILBRETH
    - 2.1.1, 2.2.0, 2.2.3, 2.3.0, 2.3.1, 2.3.2
  * - NEGISHI
    - 2.1.1, 2.2.0, 2.2.3, 2.3.0, 2.3.1
  * - SCHOLAR
    - 2.1.1, 2.2.0, 2.2.3, 2.3.0, 2.3.1

Commands
~~~~~~~
- run_alphafold.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load alphafold

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run alphafold on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=alphafold
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers alphafold

        # Your alphafold workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=alphafold
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers alphafold

        # Your alphafold workflow...

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
        #SBATCH --job-name=alphafold
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers alphafold

        # Your alphafold workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=alphafold
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers alphafold

        # Your alphafold workflow...
