.. _backbone-label:

Bismark
==============================

Introduction
~~~~~~~~
Bismark is a tool to map bisulfite treated sequencing reads to a genome of interest and perform methylation calls in a single step


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bismark 
| Home page: https://github.com/FelixKrueger/Bismark

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
    - 0.23.0, 0.24.0
  * - BELL
    - 0.23.0, 0.24.0
  * - GAUTSCHI
    - 0.23.0, 0.24.0
  * - NEGISHI
    - 0.23.0, 0.24.0
  * - SCHOLAR
    - 0.23.0, 0.24.0

Commands
~~~~~~~
- bismark
- bam2nuc
- bismark2bedGraph
- bismark2report
- bismark2summary
- bismark_genome_preparation
- bismark_methylation_extractor
- copy_bismark_files_for_release.pl
- coverage2cytosine
- deduplicate_bismark
- filter_non_conversion
- methylation_consistency
- --
- Bismark
- has
- Samtools
- Bowtie2
- and
- HISAT2
- inside.
- Should
- we
- --
- alias
- them
- for
- the
- user
- as
- well
- or
- keep
- them
- internal?
- --
- Keep
- hidden
- for
- now.

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bismark

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bismark on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=bismark
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bismark

        # Your bismark workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=bismark
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bismark

        # Your bismark workflow...

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
        #SBATCH --job-name=bismark
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bismark

        # Your bismark workflow...

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
        #SBATCH --job-name=bismark
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bismark

        # Your bismark workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=bismark
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bismark

        # Your bismark workflow...
