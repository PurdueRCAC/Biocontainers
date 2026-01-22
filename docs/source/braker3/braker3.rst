.. _backbone-label:

Braker3
==============================

Introduction
~~~~~~~~
BRAKER3 enables the usage of RNA-seq and protein data in a fully automated pipeline to train and predict highly reliable genes with GeneMark-ETP and AUGUSTUS. The result of the pipeline is the combined gene set of both gene prediction tools, which only contains genes with very high support from extrinsic evidence.


| For more information, please check:
| BioContainers: https://hub.docker.com/r/teambraker/braker3 
| Home page: https://github.com/Gaius-Augustus/BRAKER Note: Since BRAKER is a pipeline that trains AUGUSTUS, i.e. writes species specific parameter files, BRAKER needs writing access to the configuration directory of AUGUSTUS that contains such files. This installation comes with a stub of AUGUSTUS coniguration files, but you *must* copy them out from the container into a location where you have write permissions. A helper command 'copy_augustus_config' is provided to simplify the task. Follow the procedure below to put the config files in your scratch space: $ mkdir -p $RCAC_SCRATCH/augustus $ copy_augustus_config $RCAC_SCRATCH/augustus $ export AUGUSTUS_CONFIG_PATH$RCAC_SCRATCH/augustus/config You would also pass the value via command-line (use the FULL path) switch: $ braker.pl --AUGUSTUS_CONFIG_PATH$RCAC_SCRATCH/augustus/config ..... Note: If this is your first time using BRAKER3, register at https://exon.gatech.edu/GeneMark/license_download.cgi to obtain a GeneMark-ES/ET/EP+ ver 4.72_lic license for Linux 64 kernel 3.10 
| 5. Download the license file as gm_key_64 and place it in your home directory as follows: gunzip gm_key_64.gz mv gm_key_64 ~/.gm_key

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
    - v3.0.7.5, 3.0.3
  * - BELL
    - v3.0.7.5, 3.0.3
  * - GAUTSCHI
    - v3.0.7.5, 3.0.3
  * - NEGISHI
    - v3.0.7.5, 3.0.3

Commands
~~~~~~~
- braker.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load braker3

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run braker3 on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=braker3
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers braker3

        # Your braker3 workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=braker3
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers braker3

        # Your braker3 workflow...

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
        #SBATCH --job-name=braker3
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers braker3

        # Your braker3 workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=braker3
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers braker3

        # Your braker3 workflow...
