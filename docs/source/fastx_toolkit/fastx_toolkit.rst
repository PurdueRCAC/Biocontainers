.. _backbone-label:

Fastx_toolkit
==============================

Introduction
~~~~~~~~
FASTX-Toolkit is a collection of command line tools for Short-Reads FASTA/FASTQ files preprocessing.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/fastx_toolkit 
| Home page: https://github.com/agordon/fastx_toolkit

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
    - 0.0.14
  * - BELL
    - 0.0.14
  * - GAUTSCHI
    - 0.0.14
  * - NEGISHI
    - 0.0.14
  * - SCHOLAR
    - 0.0.14

Commands
~~~~~~~
- fasta_clipping_histogram.pl
- fasta_formatter
- fasta_nucleotide_changer
- fastq_masker
- fastq_quality_boxplot_graph.sh
- fastq_quality_converter
- fastq_quality_filter
- fastq_quality_trimmer
- fastq_to_fasta
- fastx_artifacts_filter
- fastx_barcode_splitter.pl
- fastx_clipper
- fastx_collapser
- fastx_nucleotide_distribution_graph.sh
- fastx_nucleotide_distribution_line_graph.sh
- fastx_quality_stats
- fastx_renamer
- fastx_reverse_complement
- fastx_trimmer
- fastx_uncollapser

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load fastx_toolkit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run fastx_toolkit on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=fastx_toolkit
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers fastx_toolkit

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=fastx_toolkit
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers fastx_toolkit

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
        #SBATCH --job-name=fastx_toolkit
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers fastx_toolkit

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=fastx_toolkit
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers fastx_toolkit
