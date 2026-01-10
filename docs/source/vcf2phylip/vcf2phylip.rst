.. _backbone-label:

Vcf2phylip
==============================

Introduction
~~~~~~~~
vcf2phylip is a tool to convert SNPs in VCF format to PHYLIP, NEXUS, binary NEXUS, or FASTA alignments for phylogenetic analysis.


| For more information, please check:
| Home page: https://github.com/edgardomortiz/vcf2phylip

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
    - 2.8
  * - BELL
    - 2.8
  * - GAUTSCHI
    - 2.8
  * - NEGISHI
    - 2.8
  * - SCHOLAR
    - 2.8

Commands
~~~~~~~
- vcf2phylip.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load vcf2phylip

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run vcf2phylip on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=vcf2phylip
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers vcf2phylip
