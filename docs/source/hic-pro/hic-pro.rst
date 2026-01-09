.. _backbone-label:

Hic-pro
==============================

Introduction
~~~~~~~~
Hicpro is an optimized and flexible pipeline for Hi-C data processing.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/nservant/hicpro 
| Home page: https://github.com/nservant/HiC-Pro

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 3.0.0, 3.1.0
  * - BELL
    - 3.0.0, 3.1.0
  * - GAUTSCHI
    - 3.0.0, 3.1.0
  * - NEGISHI
    - 3.0.0, 3.1.0
  * - SCHOLAR
    - 3.0.0, 3.1.0

Commands
~~~~~~~
- HiC-Pro
- digest_genome.py
- extract_snps.py
- hicpro2fithic.py
- hicpro2higlass.sh
- hicpro2juicebox.sh
- make_viewpoints.py
- sparseToDense.py
- split_reads.py
- split_sparse.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load hic-pro

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run hic-pro on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=hic-pro
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers hic-pro
