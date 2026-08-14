.. _backbone-label:

Ampliconsuite-pipeline
==============================

Introduction
~~~~~~~~
AmpliconSuite-pipeline is an end-to-end wrapper around AmpliconArchitect (AA) and AmpliconClassifier (AC) for detecting and classifying focal copy number amplifications, such as ecDNA and BFBs, from paired-end whole genome sequencing data. Release 1.6.0 is a coordinated release of AA v1.6.r0, AC v2.0.0 and BFBArchitect v1.0.1. Supported reference builds: hg19, GRCh37, GRCh38 (hg38), GRCh38_viral, mm10. Image provenance Built at RCAC on 2026-08-13 from AmpliconSuite-pipeline/singularity/ ampliconsuite-pipeline.def, with Bootstrap changed from library to docker and symlinks added to expose the driver scripts on PATH. The upstream def pulls master/main branch archives rather than release tags, so this image is a branch snapshot taken shortly after the v1.6.0 release, not a tagged build. Run 'AmpliconSuite-pipeline.py -v' to see the versions actually installed. Reference annotations AA_DATA_REPO points at a shared, read-only site copy under /depot/itap/datasets/ampliconsuite/data_repo. Because that copy is not writable, AA cannot cache per-BAM coverage statistics into it. Pass --no_cstats, or point AA_DATA_REPO and APPTAINERENV_AA_DATA_REPO at your own writable copy. The site copy tracks 'current', which is repointed as new annotation snapshots are staged. If you need results reproducible against a fixed snapshot, set AA_DATA_REPO to the dated directory instead. Optimization solvers No commercial solver license is required. AA falls back to Clarabel and BFBArchitect falls back to CBC. Pass --AA_solver clarabel to skip Mosek detection entirely. If you hold a personal academic Mosek license, the container looks for it at /home/mosek/ inside the container, which is NOT your home directory. Bind it: export APPTAINER_BIND"$HOME/mosek:/home/mosek" Typical usage AmpliconSuite-pipeline.py -s SAMPLE -t 12 \ --bam sample.cs.bam --ref GRCh38 \ --AA_solver clarabel --no_cstats \ --run_AA --run_AC \ -o $CLUSTER_SCRATCH/ampliconsuite_out AmpliconArchitect itself is largely serial. The -t value drives BWA, CNVkit and samtools during data preparation, so a full-node request will sit idle through the AA stage. BAMs should be coordinate sorted and BWA-MEM aligned (do not set -m) against a supported build. BAMs pulled from SRA are frequently stripped of tags that AA needs to call breakpoints correctly.


| For more information, please check:
| Home page: https://github.com/AmpliconSuite/AmpliconSuite-pipeline 
| Guide: https://github.com/AmpliconSuite/AmpliconSuite-pipeline/blob/master/documentation/GUIDE.md

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
    - 1.6.0
  * - NEGISHI
    - 1.6.0

Commands
~~~~~~~
- AmpliconSuite-pipeline.py
- GroupedAnalysisAmpSuite.py
- AmpliconArchitect.py
- amplified_intervals.py
- amplicon_classifier.py
- make_results_table.py
- feature_similarity.py
- BFBArchitect.py
- BFBArchitect-batch
- BFBArchitect-call-cnv
- cnvkit.py
- CAMPER.py
- breakpoints_to_bed.py
- convert_cns_to_bed.py
- cycles_to_bed.py
- graph_cleaner.py
- graph_to_bed.py
- plot_cnv_distribution.py
- bfb_foldback_detection.py
- integration_detection.py
- readclust.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ampliconsuite-pipeline

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ampliconsuite-pipeline on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=ampliconsuite-pipeline
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers ampliconsuite-pipeline

        # Your ampliconsuite-pipeline workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=ampliconsuite-pipeline
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers ampliconsuite-pipeline

        # Your ampliconsuite-pipeline workflow...

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
        #SBATCH --job-name=ampliconsuite-pipeline
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers ampliconsuite-pipeline

        # Your ampliconsuite-pipeline workflow...

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
        #SBATCH --job-name=ampliconsuite-pipeline
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers ampliconsuite-pipeline

        # Your ampliconsuite-pipeline workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=ampliconsuite-pipeline
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers ampliconsuite-pipeline

        # Your ampliconsuite-pipeline workflow...
