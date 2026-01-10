.. _backbone-label:

Megan
==============================

Introduction
~~~~~~~~
Megan is a computer program that allows optimized analysis of large metagenomic datasets. Metagenomics is the analysis of the genomic sequences from a usually uncultured environmental sample.


| For more information, please check:
| Home page: https://uni-tuebingen.de/fakultaeten/mathematisch-naturwissenschaftliche-fakultaet/fachbereiche/informatik/lehrstuehle/algorithms-in-bioinformatics/software/megan6/

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
    - 6.21.7
  * - BELL
    - 6.21.7
  * - GAUTSCHI
    - 6.21.7
  * - NEGISHI
    - 6.21.7
  * - SCHOLAR
    - 6.21.7

Commands
~~~~~~~
- MEGAN
- blast2lca
- blast2rma
- daa2info
- daa2rma
- daa-meganizer
- gc-assembler
- rma2info
- sam2rma
- references-annotator

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load megan

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run megan on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=megan
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers megan
