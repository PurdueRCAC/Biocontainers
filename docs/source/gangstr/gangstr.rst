.. _backbone-label:

Gangstr
==============================

Introduction
~~~~~~~~
GangSTR is a tool for genome-wide profiling tandem repeats from short reads. A key advantage of GangSTR over existing genome-wide TR tools (e.g. lobSTR or hipSTR) is that it can handle repeats that are longer than the read length. GangSTR takes aligned reads (BAM) and a set of repeats in the reference genome as input and outputs a VCF file containing genotypes for each locus.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gangstr 
| Home page: https://github.com/gymreklab/GangSTR

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.5.0
  * - BELL
    - 2.5.0
  * - GAUTSCHI
    - 2.5.0
  * - NEGISHI
    - 2.5.0
  * - SCHOLAR
    - 2.5.0

Commands
~~~~~~~
- GangSTR

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gangstr

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gangstr on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gangstr
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gangstr
