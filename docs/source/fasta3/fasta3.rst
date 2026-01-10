.. _backbone-label:

Fasta3
==============================

Introduction
~~~~~~~~
Fasta3 is a suite of programs for searching nucleotide or protein databases with a query sequence.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/fasta3 
| Home page: https://github.com/wrpearson/fasta36

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
    - 36.3.8
  * - BELL
    - 36.3.8
  * - GAUTSCHI
    - 36.3.8
  * - NEGISHI
    - 36.3.8
  * - SCHOLAR
    - 36.3.8

Commands
~~~~~~~
- fasta36
- fastf36
- fastm36
- fasts36
- fastx36
- fasty36
- ggsearch36
- glsearch36
- lalign36
- ssearch36
- tfastf36
- tfastm36
- tfasts36
- tfastx36
- tfasty36

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load fasta3

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run fasta3 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fasta3
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fasta3
