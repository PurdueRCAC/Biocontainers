.. _backbone-label:

Hypo
==============================

Introduction
~~~~~~~~
HyPo--a Hybrid Polisher-- utilises short as well as long reads within a single run to polish a long reads assembly of small and large genomes. It exploits unique genomic kmers to selectively polish segments of contigs using partial order alignment of selective read-segments. As demonstrated on human genome assemblies, Hypo generates significantly more accurate polished assembly in about one-third time with about half the memory requirements in comparison to contemporary widely used polishers like Racon.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/hypo 
| Home page: https://github.com/kensung-lab/hypo

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.0.3
  * - BELL
    - 1.0.3
  * - GAUTSCHI
    - 1.0.3
  * - NEGISHI
    - 1.0.3
  * - SCHOLAR
    - 1.0.3

Commands
~~~~~~~
- hypo

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load hypo

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run hypo on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=hypo
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers hypo
