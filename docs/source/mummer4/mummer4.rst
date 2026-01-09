.. _backbone-label:

Mummer4
==============================

Introduction
~~~~~~~~
``Mummer4`` is a versatile alignment tool for DNA and protein sequences. 

| For more information, please check its website: https://biocontainers.pro/tools/mummer4 and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 4.0.0rc1-pl5262
  * - BELL
    - 4.0.0rc1-pl5262
  * - GAUTSCHI
    - 4.0.0rc1-pl5262
  * - NEGISHI
    - 4.0.0rc1-pl5262
  * - SCHOLAR
    - 4.0.0rc1-pl5262

Commands
~~~~~~~
- annotate
- combineMUMs
- delta-filter
- delta2vcf
- dnadiff
- exact-tandems
- mummer
- mummerplot
- nucmer
- promer
- repeat-match
- show-aligns
- show-coords
- show-diff
- show-snps
- show-tiling

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load mummer4

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Mummer4 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mummer4
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mummer4

    mummer -mum -b -c H_pylori26695_Eslice.fasta H_pyloriJ99_Eslice.fasta > mummer.mums
.. _Github: https://github.com/mummer4/mummer
