.. _backbone-label:

Phyx
==============================

Introduction
~~~~~~~~
phyx (pronounced 'fix') is a collection of Unix-style command-line programs for phylogenetics and sequence/tree manipulation, designed to be composed with pipes inside larger pipelines. Notes There is no single 'phyx' executable. The package installs 48 separate 'px*' programs, all of which this module puts on the command line. Each takes '-h' for help; see the wiki for a categorised list: https://github.com/FePhyFoFum/phyx/wiki/Program-list Common entry points: pxclsq (clean alignment by occupancy), pxrmk (remove taxa), pxcat (concatenate alignments), pxbp (bipartitions), pxrr (reroot), pxlssq / pxlstr (alignment and tree summary stats). Version note: Bioconda is pinned at 1.1 while upstream is at 1.3.2. Programs added after 1.1 are NOT in this module. Citation: Brown JW, Walker JF, Smith SA. Phyx: phylogenetic tools for unix. Bioinformatics 2017;33(12):1886-1888. doi:10.1093/bioinformatics/btx063


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/phyx 
| Home page: https://github.com/FePhyFoFum/phyx

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
    - 1.1

Commands
~~~~~~~
- pxaa2cdn
- pxbdfit
- pxbdsim
- pxboot
- pxbp
- pxcat
- pxclsq
- pxcltr
- pxcolt
- pxcomp
- pxconsq
- pxcontrates
- pxfqfilt
- pxlog
- pxlssq
- pxlstr
- pxmono
- pxmrca
- pxmrcacut
- pxmrcaname
- pxnj
- pxnw
- pxrecode
- pxrevcomp
- pxrls
- pxrlt
- pxrmk
- pxrms
- pxrmt
- pxrr
- pxs2fa
- pxs2nex
- pxs2phy
- pxseqgen
- pxssort
- pxsstat
- pxstrec
- pxsw
- pxt2new
- pxt2nex
- pxtcol
- pxtcomb
- pxtgen
- pxtlate
- pxtrt
- pxtscale
- pxupgma
- pxvcf2fa

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load phyx

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run phyx on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=phyx
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers phyx

        # Your phyx workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=phyx
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers phyx

        # Your phyx workflow...

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
        #SBATCH --job-name=phyx
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers phyx

        # Your phyx workflow...

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
        #SBATCH --job-name=phyx
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers phyx

        # Your phyx workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=phyx
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers phyx

        # Your phyx workflow...
