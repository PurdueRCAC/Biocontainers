.. _backbone-label:

Proteinortho
==============================

Introduction
~~~~~~~~
Proteinortho is a tool to detect orthologous genes within different species.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/proteinortho 
| Home page: https://gitlab.com/paulklemm_PHD/proteinortho

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
    - 6.0.33
  * - BELL
    - 6.0.33
  * - GAUTSCHI
    - 6.0.33
  * - NEGISHI
    - 6.0.33
  * - SCHOLAR
    - 6.0.33

Commands
~~~~~~~
- proteinortho
- proteinortho2html.pl
- proteinortho2tree.pl
- proteinortho2xml.pl
- proteinortho6.pl
- proteinortho_cleanupblastgraph
- proteinortho_clustering
- proteinortho_compareProteinorthoGraphs.pl
- proteinortho_do_mcl.pl
- proteinortho_extract_from_graph.pl
- proteinortho_ffadj_mcs.py
- proteinortho_formatUsearch.pl
- proteinortho_grab_proteins.pl
- proteinortho_graphMinusRemovegraph
- proteinortho_history.pl
- proteinortho_singletons.pl
- proteinortho_summary.pl
- proteinortho_treeBuilderCore

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load proteinortho

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run proteinortho on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=proteinortho
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers proteinortho

        # Your proteinortho workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=proteinortho
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers proteinortho

        # Your proteinortho workflow...

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
        #SBATCH --job-name=proteinortho
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers proteinortho

        # Your proteinortho workflow...

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
        #SBATCH --job-name=proteinortho
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers proteinortho

        # Your proteinortho workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=proteinortho
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers proteinortho

        # Your proteinortho workflow...
