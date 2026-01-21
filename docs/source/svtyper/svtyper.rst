.. _backbone-label:

Svtyper
==============================

Introduction
~~~~~~~~
SVTyper performs breakpoint genotyping of structural variants (SVs) using whole genome sequencing data. svtyper is the original implementation of the genotyping algorithm, and works with multiple samples. svtyper-sso is an alternative implementation of svtyper that is optimized for genotyping a single sample. svtyper-sso is a parallelized implementation of svtyper that takes advantage of multiple CPU cores via the multiprocessing module. svtyper-sso can offer a 2x or more speedup (depending on how many CPU cores used) in genotyping a single sample. NOTE: svtyper-sso is not yet stable. There are minor logging differences between the two and svtyper-sso may exit with an error prematurely when processing CRAM files.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/svtyper 
| Home page: https://github.com/hall-lab/svtyper

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
    - 0.7.1
  * - BELL
    - 0.7.1
  * - GAUTSCHI
    - 0.7.1
  * - NEGISHI
    - 0.7.1
  * - SCHOLAR
    - 0.7.1

Commands
~~~~~~~
- svtyper
- svtyper-sso
- python
- python2

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load svtyper

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run svtyper on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=svtyper
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers svtyper

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=svtyper
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers svtyper

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
        #SBATCH --job-name=svtyper
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers svtyper

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=svtyper
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers svtyper
