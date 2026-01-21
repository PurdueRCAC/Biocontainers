.. _backbone-label:

Quickmirseq
==============================

Introduction
~~~~~~~~
QuickMIRSeq is an integrated pipeline for quick and accurate quantification of known miRNAs and isomiRs by jointly processing multiple samples. This module defines program installation directory (note: inside the container!) as environment variable $QuickMIRSeq. Once again, this is not a host path, this path is only available from inside the container. With the way this module is organized, you should be able to use the variable freely for both the perl $QuickMIRSeq/QuickMIRSeq.pl allIDs.txt run.config and the $QuickMIRSeq/QuickMIRSeq-report.sh steps as directed by the user guide. A simple 'QuickMIRSeq.pl' and 'QuickMIRSeq-report.sh' will also work (and can be a backup if the variable expansion somehow does not work for you). You will also need a run configuration file. You can copy from an existing one, or take from the user guide, or as a last resort, use Singularity to copy the template (in $QuickMIRSeq/run.config.template) from inside the container image. 'singularity shell' may be an easiest way for the latter.


| For more information, please check:
| BioContainers: https://hub.docker.com/r/gcfntnu/quickmirseq 
| Home page: https://baohongz.github.io/guide/QuickMIRSeq.html

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
    - 1.0
  * - BELL
    - 1.0
  * - GAUTSCHI
    - 1.0
  * - NEGISHI
    - 1.0
  * - SCHOLAR
    - 1.0

Commands
~~~~~~~
- perl
- QuickMIRSeq-report.sh
- pathJoin(instdir
- QuickMIRSeq-report.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load quickmirseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run quickmirseq on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=quickmirseq
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers quickmirseq

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=quickmirseq
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers quickmirseq

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
        #SBATCH --job-name=quickmirseq
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers quickmirseq

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=quickmirseq
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers quickmirseq
