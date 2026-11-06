.. _backbone-label:

Braker4
==============================

Introduction
~~~~~~~~
: Genome annotation workflow (GeneMark + AUGUSTUS + TSEBRA) in Snakemake") whatis("URL: https://github.com/Gaius-Augustus/BRAKER4") conflict(myModuleName()) conflict("snakemake") local root "/apps/biocontainers" local image pathJoin(root, "images/arnstrm2_braker4:0.5.0-beta.sif") local share pathJoin(root, "share/braker4/0.5.0-beta") local programs { "braker4", "braker4-init", "braker4-download-orthodb" } -- Read by the launchers inside the image. setenv("BRAKER4_SITE_CONFIG", pathJoin(share, "config.ini.site")) -- Inner (tool-container) binds. The image's own apptainer.conf binds only -- /etc/localtime and /etc/hosts, so data paths must be listed here. setenv("BRAKER4_BIND", "/home,/scratch,/depot,/apps") -- Outer binds come from the host apptainer.conf (/depot, /scratch, /apps on -- Negishi and Gautschi). Add "-B ..." on clusters whose apptainer.conf lacks them. -- env -u LD_PRELOAD: XALT preload breaks container glibc. -- -u PYTHONPATH/PYTHONHOME: stop host Python settings leaking into the venv. local launch "env -u LD_PRELOAD -u PYTHONPATH -u PYTHONHOME singularity exec " .. image for _, prog in ipairs(programs) do set_shell_function(prog, launch .. " " .. prog .. ' "$@"', launch .. " " .. prog .. " $*") end


| For more information, please check:
|

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

  * - GAUTSCHI
    - 0.5.0-beta
  * - NEGISHI
    - 0.5.0-beta

Commands
~~~~~~~
- braker4
- braker4-init
- braker4-download-orthodb

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load braker4

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run braker4 on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=braker4
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers braker4

        # Your braker4 workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=braker4
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers braker4

        # Your braker4 workflow...

  .. tab-item:: Gautschi-AI

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p ai          # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=braker4
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers braker4

        # Your braker4 workflow...

  .. tab-item:: Gilbreth

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p a100        # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH --mem=2G       # Memory
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=braker4
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers braker4

        # Your braker4 workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=braker4
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers braker4

        # Your braker4 workflow...
