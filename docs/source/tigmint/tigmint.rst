.. _backbone-label:

Tigmint
==============================

Introduction
~~~~~~~~
Tigmint identifies and corrects misassemblies using linked (e.g. MGI's stLFR, 10x Genomics Chromium) or long (e.g. Oxford Nanopore Technologies long reads) DNA sequencing reads. The reads are first aligned to the assembly, and the extents of the large DNA molecules are inferred from the alignments of the reads. The physical coverage of the large molecules is more consistent and less prone to coverage dropouts than that of the short read sequencing data. The sequences are cut at positions that have insufficient spanning molecules. Tigmint outputs a BED file of these cut points, and a FASTA file of the cut sequences.
For more information, please check:
Home page: https://github.com/bcgsc/tigmint

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.2.6
  * - BELL
    - 1.2.6
  * - GAUTSCHI
    - 1.2.6
  * - NEGISHI
    - 1.2.6
  * - SCHOLAR
    - 1.2.6

Commands
~~~~~~~
- tigmint
- tigmint-arcs-tsv
- tigmint-cut
- tigmint-make
- tigmint_estimate_dist.py
- tigmint_molecule.py
- tigmint_molecule_paf.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load tigmint

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run tigmint on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=tigmint
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers tigmint
