.. _backbone-label:

Viennarna
==============================

Introduction
~~~~~~~~
Viennarna is a set of standalone programs and libraries used for prediction and analysis of RNA secondary structures.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/viennarna 
| Home page: https://www.tbi.univie.ac.at/RNA/

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
    - 2.5.0
  * - BELL
    - 2.5.0
  * - GAUTSCHI
    - 2.5.0
  * - NEGISHI
    - 2.5.0
  * - SCHOLAR
    - 2.5.0

Commands
~~~~~~~
- RNA2Dfold
- RNALalifold
- RNALfold
- RNAPKplex
- RNAaliduplex
- RNAalifold
- RNAcofold
- RNAdistance
- RNAdos
- RNAduplex
- RNAeval
- RNAfold
- RNAforester
- RNAheat
- RNAinverse
- RNAlocmin
- RNAmultifold
- RNApaln
- RNAparconv
- RNApdist
- RNAplex
- RNAplfold
- RNAplot
- RNApvmin
- RNAsnoop
- RNAsubopt
- RNAup
- Kinfold
- b2ct
- popt

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load viennarna

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run viennarna on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=viennarna
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers viennarna

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=viennarna
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers viennarna

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
        #SBATCH --job-name=viennarna
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers viennarna

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=viennarna
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers viennarna
