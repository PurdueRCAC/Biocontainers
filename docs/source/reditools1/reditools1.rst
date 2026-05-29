.. _backbone-label:

Reditools1
==============================

Introduction
~~~~~~~~
REDItools v1.3 is a suite of Python scripts for detecting RNA editing events from RNA-seq data (and optionally matched DNA-seq). It supports de novo detection, DNA/RNA-paired calling, and known-site re-quantification, plus a set of table/GFF accessory utilities used to filter, annotate, sort, and index editing call tables. This module runs the upstream tools inside an Apptainer/Singularity image built from a Python 2.7 conda environment (pysam 0.15.4, samtools/htslib 1.9, numpy 1.16.6, scipy 1.2.3, fisher 0.1.5). Exposed commands Core callers (main/): REDItoolDenovo.py REDItoolDnaRna.py REDItoolKnown.py Nature Protocol runtime tools (NPscripts/): REDItoolDnaRnav13.py collect_editing_candidates.py get_Statistics.py Accessory utilities (accessory/): AnnotateTable.py FilterTable.py GFFtoTabix.py SearchInTable.py SortGFF.py SortTable.py TableToGFF.py get_DE_events.py readPsl.py rediportal2recoding.py selectPositions.py subCount.py subCount2.py tableToTabix.py Note: invoke each script with its full name including the .py suffix (e.g. "REDItoolDenovo.py -h"). The script's own current directory is bound into the container, so input/output paths work as on the host. Citations - Picardi E, Pesole G. REDItools: high-throughput RNA editing detection made easy. Bioinformatics. 2013;29(14):1813-1814. - Lo Giudice C, Tangaro MA, Pesole G, Picardi E. Investigating RNA editing in deep transcriptome datasets with REDItools and REDIportal. Nat Protoc. 2020;15(3):1098-1131.


| For more information, please check:
| Home page: https://github.com/BioinfoUNIBA/REDItools 
| Documentation: https://github.com/BioinfoUNIBA/REDItools/blob/master/README_1.md 
| REDIportal: http://srv00.recas.ba.infn.it/atlas/

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
    - 1.3
  * - NEGISHI
    - 1.3

Commands
~~~~~~~
- --
- main/
- (core
- callers)
- REDItoolDenovo.py
- REDItoolDnaRna.py
- REDItoolKnown.py
- --
- NPscripts/
- (Nature
- Protocol
- runtime
- tools
- symlinked
- into
- /opt/REDItools/bin)
- REDItoolDnaRnav13.py
- collect_editing_candidates.py
- get_Statistics.py
- --
- accessory/
- (table
- and
- GFF
- utilities)
- AnnotateTable.py
- FilterTable.py
- GFFtoTabix.py
- SearchInTable.py
- SortGFF.py
- SortTable.py
- TableToGFF.py
- get_DE_events.py
- readPsl.py
- rediportal2recoding.py
- selectPositions.py
- subCount.py
- subCount2.py
- tableToTabix.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load reditools1

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run reditools1 on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=reditools1
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers reditools1

        # Your reditools1 workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=reditools1
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers reditools1

        # Your reditools1 workflow...

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
        #SBATCH --job-name=reditools1
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers reditools1

        # Your reditools1 workflow...

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
        #SBATCH --job-name=reditools1
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers reditools1

        # Your reditools1 workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=reditools1
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers reditools1

        # Your reditools1 workflow...
