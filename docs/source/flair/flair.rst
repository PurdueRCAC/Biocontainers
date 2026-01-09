.. _backbone-label:

Flair
==============================

Introduction
~~~~~~~~
flair (Full-Length Alternative Isoform analysis of RNA) for the correction, isoform definition, and alternative splicing analysis of noisy reads


| For more information, please check:
| BioContainers: 
| Home page: https://flair.readthedocs.io/en/latest

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.0.0
  * - BELL
    - 2.0.0
  * - NEGISHI
    - 2.0.0

Commands
~~~~~~~
- collapse_bed_files
- diff_iso_usage
- diffsplice_fishers_exact
- fasta_seq_lengths
- junctions_from_sam
- mark_intron_retention
- mark_productivity
- normalize_counts_matrix
- plot_isoform_usage
- predictProductivity
- bam2Bed12
- sam_to_map
- flair

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load flair

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run flair on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=flair
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers flair
