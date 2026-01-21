.. _backbone-label:

Lr_gapcloser
==============================

Introduction
~~~~~~~~
LR_Gapcloser is a gap closing tool using long reads from studied species.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/lr_gapcloser 
| Home page: https://github.com/CAFS-bioinformatics/LR_Gapcloser

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
    - 20180904
  * - NEGISHI
    - 20180904

Commands
~~~~~~~
- LR_Gapcloser.sh
- best-match-LR.pl
- block_align.pl
- bwa
- change_case_fasta.pl
- complete_retriver.pl
- complete_substitute_limiter.pl
- complete_ultimate_elect.pl
- coverage_calculator.pl
- coverage_filter.pl
- find_sequnce_file.pl
- form_sequence.pl
- format_fa.pl
- further_partial_select.pl
- gap_bridging.pl
- gap_finder.pl
- group_partial.pl
- info_formatter.pl
- info_pacify.pl
- join_LRlength.pl
- last_Drepeat.pl
- partial_ultimate_elect.pl
- remove_wrong3.pl
- retrieve-unique-alignment.pl
- retriever_backfill.pl
- same_filter.pl
- split
- tag_alignment_filter.pl
- tag_distance_filter_classify.pl
- tag_generator.pl
- tag_orientation_corrector.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load lr_gapcloser

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run lr_gapcloser on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=lr_gapcloser
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers lr_gapcloser

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=lr_gapcloser
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers lr_gapcloser

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
        #SBATCH --job-name=lr_gapcloser
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers lr_gapcloser

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=lr_gapcloser
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers lr_gapcloser
