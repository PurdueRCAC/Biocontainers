.. _backbone-label:

Jacks
==============================

Introduction
~~~~~~~~
JACKS (Joint Analysis of CRISPR/Cas9 Knockout Screens) is a Bayesian method that jointly infers per-gRNA efficacy and per-sample gene essentiality from pooled CRISPR/Cas9 screen count data. Sharing gRNA efficacy across screens improves essentiality estimates relative to per-screen methods, and pre-trained efficacies for common libraries (Avana, GeCKOv2, Yusa v1.0, TKOv1, Whitehead) can be reused on new screens. Commands provided - run_JACKS.py run inference on a count matrix + replicate map + sgRNA map - plot_heatmap.py render a per-gene heatmap from the run_JACKS.py pickle output Environment variables set by this module - JACKS_HOME /opt/jacks (inside the container) - JACKS_EXAMPLE_DIR bundled example datasets - JACKS_REF_DIR pre-trained gRNA efficacy files for --reffile Example module load jacks/0.2 run_JACKS.py counts.tab repmap.tab counts.tab \ --common_ctrl_sampleCTRL --gene_hdrgene \ --outprefixresults/screen --ctrl_genesNEGv1.txt # reuse pre-trained efficacies for the Yusa v1.0 library run_JACKS.py counts.tab repmap.tab counts.tab \ --common_ctrl_sampleCTRL --outprefixresults/screen \ --reffile$JACKS_REF_DIR/yusa_v10_grna_JACKS_results.txt plot_heatmap.py results/screen_JACKS_results_full.pickle KRAS results/KRAS.png Notes - Single-threaded. Request one core; OMP_NUM_THREADS is set to 1 unless you have already set it, to keep the bundled OpenBLAS from oversubscribing the node. - plot_heatmap.py writes matplotlib DEBUG lines to stderr. This is an upstream logging quirk, not an error. Citation Allen F, Behan F, Khodak A, et al. JACKS: joint analysis of CRISPR/Cas9 knockout screens. Genome Research. 2019;29(3):464-471. doi:10.1101/gr.238923.118


| For more information, please check:
| Container image: docker://arnstrm2/jacks:0.2 
| Home page: https://github.com/felicityallen/JACKS

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
    - 0.2
  * - NEGISHI
    - 0.2

Commands
~~~~~~~
- run_JACKS.py
- plot_heatmap.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load jacks

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run jacks on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=jacks
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers jacks

        # Your jacks workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=jacks
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers jacks

        # Your jacks workflow...

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
        #SBATCH --job-name=jacks
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers jacks

        # Your jacks workflow...

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
        #SBATCH --job-name=jacks
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers jacks

        # Your jacks workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=jacks
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers jacks

        # Your jacks workflow...
