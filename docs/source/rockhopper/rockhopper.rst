.. _backbone-label:

Rockhopper
==============================

Introduction
~~~~~~~~
Rockhopper is a system for computational analysis of bacterial RNA-seq data. It takes FASTQ, QSEQ, FASTA, SAM or BAM reads and performs read alignment, reference-based or de novo transcript assembly, transcript boundary and novel transcript (e.g. sRNA) detection, normalization, quantification, differential expression testing and operon prediction, with a built-in genome browser. All analysis is self-contained in a single Java jar; no external aligners are required. This module provides one command, available as either "Rockhopper" or "rockhopper": Rockhopper launches the graphical interface (requires a display) Rockhopper <options> runs Rockhopper in command-line mode Rockhopper -h prints command-line options Running the graphical interface (GUI) The GUI needs an X display and should run on a compute node, not a login or ThinLinc front-end node, since alignment is CPU and memory intensive. Option 1 (recommended): Open OnDemand desktop 1. Log in to the cluster's Open OnDemand portal (https://gateway.<cluster>.rcac.purdue.edu). 2. Launch the Desktop interactive app with the cores and walltime you need. 3. Open a terminal in the desktop session and run: module --force purge module load biocontainers rockhopper/2.0.3 cd $RCAC_SCRATCH/my_project Rockhopper Option 2: SSH with X11 forwarding 1. Connect with X11 forwarding (macOS needs XQuartz; Windows needs an X server such as MobaXterm): ssh -Y <username>@<cluster>.rcac.purdue.edu 2. Request an interactive job on a compute node with X11 enabled: sinteractive -A <account> -N 1 -n 8 -t 02:00:00 (or: srun -A <account> -N 1 -n 8 -t 02:00:00 --x11 --pty bash) 3. Load the module and start the GUI as in Option 1. X11 forwarding over SSH can be slow for the genome browser; Option 1 is usually more responsive. Running in command-line mode (batch jobs) For multi-sample experiments, command-line mode in a Slurm batch job is more reproducible and is not lost if an interactive session ends. Run "Rockhopper -h" for the full option list. Read files are positional arguments: - replicates of one condition are comma-separated - conditions are separated by spaces - mates of a paired-end library are joined with '%' - differential expression is tested between condition pairs 1 vs 2, 3 vs 4, ..., so order conditions accordingly Reference-based vs de novo: - With -g, reads are aligned to the genome(s). Each -g directory must contain a genome FASTA (*.fna), protein-coding gene table (*.ptt) and RNA gene table (*.rnt). The command line does NOT download genomes from GenBank the way the GUI does; you must supply these files. - WITHOUT -g, Rockhopper silently runs de novo transcript assembly. Commonly used options: -p <int> number of processors (match the cores requested) -s <bool> strand-specific library (default true; set -s false for unstranded libraries) -ff/fr/rf/rr mate orientation for paired-end reads (default fr) -L <a,b,...> condition labels -o <dir> output directory (default Rockhopper_Results/) -v true verbose output with raw/normalized counts per gene -SAM also write alignments as SAM Example: reference-based, paired-end, two conditions x two replicates #!/bin/bash #SBATCH -A <account> #SBATCH -N 1 #SBATCH -n 16 #SBATCH -t 12:00:00 module --force purge module load biocontainers rockhopper/2.0.3 export ROCKHOPPER_XMX32g Rockhopper -p 16 -s true -g genome_dir -o rockhopper_out -L control,treated \ ctrl1_R1.fastq.gz%ctrl1_R2.fastq.gz,ctrl2_R1.fastq.gz%ctrl2_R2.fastq.gz \ trt1_R1.fastq.gz%trt1_R2.fastq.gz,trt2_R1.fastq.gz%trt2_R2.fastq.gz Example: de novo, single-end (no -g) Rockhopper -p 16 -o rockhopper_denovo -L control,treated \ ctrl1.fastq.gz,ctrl2.fastq.gz trt1.fastq.gz,trt2.fastq.gz For de novo runs, raising the k-mer hashtable size (-n 26) needs a larger Java heap (ROCKHOPPER_XMX). Java memory The Java heap defaults to 8 GB. Override it before running: export ROCKHOPPER_XMX32g Keep this below the memory available to your job (memory is allocated in proportion to the cores requested). Additional JVM flags can be passed with ROCKHOPPER_JAVA_OPTS. Notes - Rockhopper writes results to the directory it is started from (or to -o), so start it from your scratch or depot space rather than $HOME. - If the GUI reports "no DISPLAY set", you are not in an OOD desktop or an X11-forwarded session.


| For more information, please check:
| Home page: http://cs.wellesley.edu/~btjaden/Rockhopper/ 
| Source: https://github.com/btjaden/Rockhopper 
| Citation: McClure R, et al. Computational analysis of bacterial RNA-Seq data. Nucleic Acids Res. 2013;41(14):e140.

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
    - 2.0.3
  * - NEGISHI
    - 2.0.3

Commands
~~~~~~~
- Rockhopper
- rockhopper

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load rockhopper

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rockhopper on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=rockhopper
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers rockhopper

        # Your rockhopper workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=rockhopper
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers rockhopper

        # Your rockhopper workflow...

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
        #SBATCH --job-name=rockhopper
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers rockhopper

        # Your rockhopper workflow...

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
        #SBATCH --job-name=rockhopper
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers rockhopper

        # Your rockhopper workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=rockhopper
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers rockhopper

        # Your rockhopper workflow...
