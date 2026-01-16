.. _backbone-label:

Liftofftools
==============================

Introduction
~~~~~~~~
LiftoffTools is a toolkit to compare genes lifted between genome assemblies. Specifically it is designed to compare genes lifted over using Liftoff although it is also compatible with other lift-over tools such as UCSC liftOver as long as the feature IDs are the same. LiftoffTools provides 3 different modules. The first identifies variants in protein-coding genes and their effects on the gene. The second compares the gene synteny, and the third clusters genes into groups of paralogs to evaluate gene copy number gain and loss. The input for all modules is the reference genome assembly (FASTA), target genome assembly (FASTA), reference annotation (GFF/GTF), and target annotation (GFF/GTF).


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/liftofftools 
| Home page: https://github.com/agshumate/LiftoffTools

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
    - 0.4.4
  * - BELL
    - 0.4.4
  * - GAUTSCHI
    - 0.4.4
  * - NEGISHI
    - 0.4.4
  * - SCHOLAR
    - 0.4.4

Commands
~~~~~~~
- liftofftools

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load liftofftools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run liftofftools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=liftofftools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers liftofftools
