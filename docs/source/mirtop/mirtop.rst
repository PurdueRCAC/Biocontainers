.. _backbone-label:

Mirtop
==============================

Introduction
~~~~~~~~
Mirtop is a ommand line tool to annotate with a standard naming miRNAs e isomiRs.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/mirtop 
| Home page: https://github.com/miRTop/mirtop

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.4.25
  * - BELL
    - 0.4.25
  * - GAUTSCHI
    - 0.4.25
  * - NEGISHI
    - 0.4.25
  * - SCHOLAR
    - 0.4.25

Commands
~~~~~~~
- mirtop

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load mirtop

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run mirtop on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mirtop
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mirtop

    mirtop gff --format prost --sps hsa 
        --hairpin examples/annotate/hairpin.fa \
        --gtf examples/annotate/hsa.gff3 \
        -o test_out \
        examples/prost/prost.example.txt
