.. _backbone-label:

Phast
==============================

Introduction
~~~~~~~~
PHAST is a freely available software package for comparative and evolutionary genomics.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/phast 
| Home page: http://compgen.cshl.edu/phast/

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
    - 1.5
  * - BELL
    - 1.5
  * - GAUTSCHI
    - 1.5
  * - NEGISHI
    - 1.5
  * - SCHOLAR
    - 1.5

Commands
~~~~~~~
- all_dists
- base_evolve
- chooseLines
- clean_genes
- consEntropy
- convert_coords
- display_rate_matrix
- dless
- dlessP
- draw_tree
- eval_predictions
- exoniphy
- hmm_train
- hmm_tweak
- hmm_view
- indelFit
- indelHistory
- maf_parse
- makeHKY
- modFreqs
- msa_diff
- msa_split
- msa_view
- pbsDecode
- pbsEncode
- pbsScoreMatrix
- pbsTrain
- phast
- phastBias
- phastCons
- phastMotif
- phastOdds
- phyloBoot
- phyloFit
- phyloP
- prequel
- refeature
- stringiphy
- treeGen
- tree_doctor

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load phast

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run phast on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=phast
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers phast

        # Your phast workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=phast
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers phast

        # Your phast workflow...

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
        #SBATCH --job-name=phast
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers phast

        # Your phast workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=phast
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers phast

        # Your phast workflow...
