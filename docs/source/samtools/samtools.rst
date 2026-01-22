.. _backbone-label:

Samtools
==============================

Introduction
~~~~~~~~
Samtools is a set of utilities for the Sequence Alignment/Map (SAM) format.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/samtools 
| Home page: https://github.com/samtools/samtools

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
    - 1.9, 1.15, 1.16, 1.17
  * - BELL
    - 1.9, 1.15, 1.16, 1.17, 1.22.1
  * - GAUTSCHI
    - 1.9, 1.15, 1.16, 1.17, 1.22.1
  * - NEGISHI
    - 1.9, 1.15, 1.16, 1.17, 1.22.1
  * - SCHOLAR
    - 1.9, 1.15, 1.16, 1.17

Commands
~~~~~~~
- ace2sam
- blast2sam.pl
- bowtie2sam.pl
- export2sam.pl
- fasta-sanitize.pl
- interpolate_sam.pl
- maq2sam-long
- maq2sam-short
- md5fa
- md5sum-lite
- novo2sam.pl
- plot-ampliconstats
- plot-bamstats
- psl2sam.pl
- sam2vcf.pl
- samtools
- samtools.pl
- seq_cache_populate.pl
- soap2sam.pl
- wgsim
- wgsim_eval.pl
- zoom2sam.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load samtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run samtools on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=samtools
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers samtools

        # Your samtools workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=samtools
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers samtools

        # Your samtools workflow...

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
        #SBATCH --job-name=samtools
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers samtools

        # Your samtools workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=samtools
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers samtools

        # Your samtools workflow...
