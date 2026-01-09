.. _backbone-label:

Masurca
==============================

Introduction
~~~~~~~~
The MaSuRCA (Maryland Super Read Cabog Assembler) genome assembly and analysis toolkit contains of MaSuRCA genome assembler, QuORUM error corrector for Illumina data, POLCA genome polishing software, Chromosome scaffolder, jellyfish mer counter, and MUMmer aligner.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/masurca 
| Home page: https://github.com/alekseyzimin/masurca

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 4.0.9, 4.1.0
  * - BELL
    - 4.0.9, 4.1.0
  * - GAUTSCHI
    - 4.0.9, 4.1.0
  * - NEGISHI
    - 4.0.9, 4.1.0
  * - SCHOLAR
    - 4.0.9, 4.1.0

Commands
~~~~~~~
- masurca
- build_human_reference.sh
- chromosome_scaffolder.sh
- close_gaps.sh
- close_scaffold_gaps.sh
- correct_with_k_unitigs.sh
- deduplicate_contigs.sh
- deduplicate_unitigs.sh
- eugene.sh
- extract_chrM.sh
- filter_library.sh
- final_polish.sh
- fix_unitigs.sh
- fragScaff.sh
- mega_reads_assemble_cluster.sh
- mega_reads_assemble_cluster2.sh
- mega_reads_assemble_polish.sh
- mega_reads_assemble_ref.sh
- parallel_delta-filter.sh
- polca.sh
- polish_with_illumina_assembly.sh
- recompute_astat_superreads.sh
- recompute_astat_superreads_CA8.sh
- reconcile_alignments.sh
- refine.sh
- resolve_trio.sh
- run_ECR.sh
- samba.sh
- splitScaffoldsAtNs.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load masurca

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run masurca on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=masurca
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers masurca
