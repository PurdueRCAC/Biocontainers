.. _backbone-label:

Maker
==============================

Introduction
~~~~~~~~
Maker is a portable and easily configurable genome annotation pipeline. Note: To run MAKER MPI, please use the below two lines: export SINGULARITYENV_LIBDIR"/depot/itap/datasets/Maker/RepeatMasker/Libraries" srun -n XX singularity exec /apps/biocontainers/images/maker_3.01.03.sif maker


| For more information, please check:
| Home page: https://www.yandell-lab.org/software/maker.html

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
    - 2.31.11, 3.01.03
  * - BELL
    - 2.31.11, 3.01.03
  * - GAUTSCHI
    - 2.31.11, 3.01.03
  * - NEGISHI
    - 2.31.11, 3.01.03
  * - SCHOLAR
    - 2.31.11, 3.01.03

Commands
~~~~~~~
- AED_cdf_generator.pl
- TACC.PL
- cegma2zff
- chado2gff3
- compare_gff3_to_chado
- cufflinks2gff3
- fasta_merge
- fasta_tool
- genemark_gtf2gff3
- gff3_merge
- ipr_update_gff
- iprscan2gff3
- maker
- maker2chado
- maker2eval_gtf
- maker2jbrowse
- maker2wap
- maker2zff
- maker_functional_fasta
- maker_functional_gff
- maker_map_ids
- map2assembly
- map_data_ids
- map_fasta_ids
- map_gff_ids
- match2gene.pl
- quality_filter.pl
- split_gff3
- tophat2gff3
- train_augustus.pl
- zff2genbank.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load maker

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run maker on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=maker
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers maker

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=maker
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers maker

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
        #SBATCH --job-name=maker
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers maker

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=maker
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers maker
