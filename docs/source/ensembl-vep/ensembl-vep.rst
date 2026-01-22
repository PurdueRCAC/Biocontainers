.. _backbone-label:

Ensembl-vep
==============================

Introduction
~~~~~~~~
Ensembl-vep(Ensembl Variant Effect Predictor) predicts the functional effects of genomic variants.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/ensemblorg/ensembl-vep 
| Home page: https://github.com/Ensembl/ensembl-vep

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
    - 106.1, 107.0, 108.2
  * - BELL
    - 106.1, 107.0, 108.2
  * - GAUTSCHI
    - 106.1, 107.0, 108.2
  * - NEGISHI
    - 106.1, 107.0, 108.2
  * - SCHOLAR
    - 106.1, 107.0, 108.2

Commands
~~~~~~~
- vep
- haplo
- variant_recoder

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ensembl-vep

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ensembl-vep on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=ensembl-vep
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers ensembl-vep

        # Your ensembl-vep workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=ensembl-vep
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers ensembl-vep

        # Your ensembl-vep workflow...

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
        #SBATCH --job-name=ensembl-vep
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers ensembl-vep

        # Your ensembl-vep workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=ensembl-vep
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers ensembl-vep

        # Your ensembl-vep workflow...
