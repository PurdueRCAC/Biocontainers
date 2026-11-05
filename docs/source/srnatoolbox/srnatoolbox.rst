.. _backbone-label:

Srnatoolbox
==============================

Introduction
~~~~~~~~
sRNAtoolbox is a collection of tools for small RNA research: expression profiling and novel miRNA prediction (sRNAbench), differential expression (sRNAde), analysis of unmapped reads with BLAST (sRNAblast), consensus miRNA target prediction (miRNAconsTargets), and degradome analysis (sRNAdegradome). This build uses the sRNAtoolbox GitHub jars at commit 2e812f7 (2023-01-16; sRNAbench and sRNAde 2.1, 04/2022), the database libraries and R scripts from the upstream ugrbioinfo/srnatoolbox:0.0.6 image, and dependencies from Bioconda: bowtie 1.3.1, samtools 1.21, BLAST+ 2.16.0, ViennaRNA 2.6.4, miRanda 3.3a, FastQC 0.12.1, sra-tools 3.1.1, OpenJDK 11, and R 4.3 with DESeq2, edgeR, and NOISeq. Commands Each tool is a Java jar in the container, exposed as a shell function: sRNAbench, sRNAde, sRNAblast, sRNAdegradome, sRNAhelper, miRNAconsTargets, miRgFree, MiRor, detectSpecies, makeSeqObj, makeTargetPositionalConsensus Run any command without arguments to print its usage. Usage Arguments use the upstream keyvalue syntax. Use absolute paths for input and output. Always set output; the default location inside the container is read-only. Library-only profiling (no genome): sRNAbench input$PWD/reads.fq.gz output$PWD/sb_out microRNAhsa \ adapterTGGAATTCTCGGGTGCCAAGG p$SLURM_CPUS_PER_TASK Genome mode with your own database copy: 1. Copy the bundled database to a writable location (one time): mkdir -p /depot/<lab>/srnatoolboxDB singularity exec $SRNATOOLBOX_IMAGE cp -r /opt/sRNAtoolboxDB/. /depot/<lab>/srnatoolboxDB/ 2. Build a bowtie 1.x index (not bowtie2) into its index/ folder: singularity exec $SRNATOOLBOX_IMAGE bowtie-build --threads 8 genome.fa \ /depot/<lab>/srnatoolboxDB/index/<name> 3. Run with dbPath and species<name>: sRNAbench dbPath/depot/<lab>/srnatoolboxDB species<name> \ input$PWD/reads.fq.gz output$PWD/sb_out microRNA<code> \ p$SLURM_CPUS_PER_TASK Environment SRNATOOLBOX_DB Default database directory; used automatically, dbPath overrides it. SRNATOOLBOX_EXEC Directory of the jar files inside the container SRNATOOLBOX_IMAGE Container image used by this module SRNATOOLBOX_BLASTDB RCAC shared NCBI BLAST databases (also set as BLASTDB inside the container) SRNATOOLBOX_JAVA_OPTS Optional JVM options, set by the user before calling a tool, e.g. export SRNATOOLBOX_JAVA_OPTS"-Xmx16g" Notes - The bundled database (miRBase, MirGeneDB, PmiREN, miRCarta) dates from February 2023 and is read-only. No genome indexes are bundled. The upstream database update service is no longer available. - sRNAblast: the upstream default blastDBnr is a protein database and does not work with blastn. Always pass a nucleotide database: blastDBcore_nt (recommended; smaller and faster), blastDBnt, or blastDB/path/to/your_db. Shared databases are refreshed monthly; see $SRNATOOLBOX_BLASTDB/MANIFEST.tsv for versions. sRNAblast input$PWD/reads.fq.gz output$PWD/blast_out blastDBcore_nt \ maxReads500 p$SLURM_CPUS_PER_TASK - SRA accessions as input need outbound internet access from the compute node; local FASTQ files are recommended. - miRNAconsTargets: miRanda (MIRANDA), PITA, and SEED methods are available. TargetSpy (TS) and the plant target tools (psRobot, TAPIR) are not included. - Java heap: OpenJDK 11 sizes the default heap from the job's memory allocation. Raise it with SRNATOOLBOX_JAVA_OPTS for large datasets.


| For more information, please check:
| Docker Hub: https://hub.docker.com/r/arnstrm2/srnatoolbox 
| Upstream image: https://hub.docker.com/r/ugrbioinfo/srnatoolbox 
| Home page: https://arn.ugr.es/srnatoolbox 
| Source: https://github.com/bioinfoUGR/sRNAtoolbox 
| Citation: Aparicio-Puerta et al. (2022) Nucleic Acids Res 50(W1):W710-W717 https://doi.org/10.1093/nar/gkac363

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
    - 2023.01.16
  * - NEGISHI
    - 2023.01.16

Commands
~~~~~~~
- sRNAbench
- sRNAde
- sRNAblast
- sRNAdegradome
- sRNAhelper
- miRNAconsTargets
- miRgFree
- MiRor
- detectSpecies
- makeSeqObj
- makeTargetPositionalConsensus

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load srnatoolbox

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run srnatoolbox on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=srnatoolbox
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers srnatoolbox

        # Your srnatoolbox workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=srnatoolbox
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers srnatoolbox

        # Your srnatoolbox workflow...

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
        #SBATCH --job-name=srnatoolbox
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers srnatoolbox

        # Your srnatoolbox workflow...

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
        #SBATCH --job-name=srnatoolbox
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers srnatoolbox

        # Your srnatoolbox workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=srnatoolbox
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers srnatoolbox

        # Your srnatoolbox workflow...
