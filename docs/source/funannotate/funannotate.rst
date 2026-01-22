.. _backbone-label:

Funannotate
==============================

Introduction
~~~~~~~~
Funannotate is a genome prediction, annotation, and comparison software package.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/nextgenusfs/funannotate 
| Home page: https://github.com/nextgenusfs/funannotate Note: For some steps, Funannotate needs to trains AUGUSTUS, i.e. writes species specific parameter files. Funannotate needs writing access to the configuration directory of AUGUSTUS that contains such files. This installation comes with a stub of AUGUSTUS coniguration files, but you *must* copy them out from the container into a location where you have write permissions. A helper command 'copy_augustus_config' is provided to simplify the task. Follow the procedure below to put the config files in your scratch space: $ mkdir -p $RCAC_SCRATCH/augustus $ copy_augustus_config $RCAC_SCRATCH/augustus $ export AUGUSTUS_CONFIG_PATH$RCAC_SCRATCH/augustus/config

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
    - v1.8.17, 1.8.10, 1.8.13, 1.8.15
  * - BELL
    - v1.8.17, 1.8.10, 1.8.13, 1.8.15
  * - GAUTSCHI
    - v1.8.17, 1.8.10, 1.8.13, 1.8.15
  * - NEGISHI
    - v1.8.17, 1.8.10, 1.8.13, 1.8.15
  * - SCHOLAR
    - 1.8.10, 1.8.13

Commands
~~~~~~~
- funannotate

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load funannotate

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run funannotate on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=funannotate
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers funannotate

        # Your funannotate workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=funannotate
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers funannotate

        # Your funannotate workflow...

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
        #SBATCH --job-name=funannotate
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers funannotate

        # Your funannotate workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=funannotate
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers funannotate

        # Your funannotate workflow...
