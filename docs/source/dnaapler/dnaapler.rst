.. _backbone-label:

Dnaapler
==============================

Introduction
~~~~~~~~
dnaapler is a simple python program that takes a single nucleotide input sequence (in FASTA format), finds the desired start gene using blastx against an amino acid sequence database, checks that the start codon of this gene is found, and if so, then reorients the chromosome to begin with this gene on the forward strand.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/dnaapler 
| Home page: https://github.com/gbouras13/dnaapler

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.1.0
  * - BELL
    - 0.1.0
  * - GAUTSCHI
    - 0.1.0
  * - NEGISHI
    - 0.1.0
  * - SCHOLAR
    - 0.1.0

Commands
~~~~~~~
- dnaapler

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load dnaapler

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run dnaapler on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=dnaapler
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers dnaapler
