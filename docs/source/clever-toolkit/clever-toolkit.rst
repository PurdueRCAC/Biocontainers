.. _backbone-label:

Clever-toolkit
==============================

Introduction
~~~~~~~~
Clever-toolkit is a collection of tools to discover and genotype structural variations in genomes from paired-end sequencing reads. The main software is written in C++ with some auxiliary scripts in Python.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/clever-toolkit 
| Home page: https://bitbucket.org/tobiasmarschall/clever-toolkit/src/master/

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
    - 2.4
  * - BELL
    - 2.4
  * - GAUTSCHI
    - 2.4
  * - NEGISHI
    - 2.4
  * - SCHOLAR
    - 2.4

Commands
~~~~~~~
- clever
- laser
- bam-to-alignment-priors
- split-priors-by-chromosome
- clever-core
- postprocess-predictions
- evaluate-sv-predictions
- split-reads
- laser-core
- laser-recalibrate
- genotyper
- insert-length-histogram
- add-score-tags-to-bam
- bam2fastq
- remove-redundant-variations
- precompute-distributions
- extract-bad-reads
- filter-variations
- merge-to-vcf
- multiline-to-xa
- filter-bam
- read-group-stats

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load clever-toolkit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run clever-toolkit on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=clever-toolkit
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers clever-toolkit

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=clever-toolkit
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers clever-toolkit

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
        #SBATCH --job-name=clever-toolkit
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers clever-toolkit

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=clever-toolkit
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers clever-toolkit
