.. _backbone-label:

Humann
==============================

Introduction
~~~~~~~~
Humann is a pipeline for efficiently and accurately profiling the presence/absence and abundance of microbial pathways in a community from metagenomic or metatranscriptomic sequencing data (typically millions of short DNA/RNA reads).


| For more information, please check:
| Docker hub: https://hub.docker.com/r/biobakery/humann 
| Home page: https://github.com/biobakery/humann

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
    - 3.0.0, 3.6
  * - BELL
    - 3.0.0, 3.6
  * - GAUTSCHI
    - 3.0.0, 3.6
  * - NEGISHI
    - 3.0.0, 3.6
  * - SCHOLAR
    - 3.0.0, 3.6

Commands
~~~~~~~
- humann
- humann3
- humann3_databases
- humann_associate
- humann_barplot
- humann_benchmark
- humann_build_custom_database
- humann_config
- humann_databases
- humann_genefamilies_genus_level
- humann_humann1_kegg
- humann_infer_taxonomy
- humann_join_tables
- humann_reduce_table
- humann_regroup_table
- humann_rename_table
- humann_renorm_table
- humann_rna_dna_norm
- humann_split_stratified_table
- humann_split_table
- humann_strain_profiler
- humann_test
- humann_unpack_pathways

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load humann

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run humann on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=humann
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers humann
