.. _backbone-label:

Megahit
==============================

Introduction
~~~~~~~~
``Megahit`` is a ultra-fast single-node solution for large and complex metagenomics assembly via succinct de Bruijn graph. 

| For more information, please check its website: https://biocontainers.pro/tools/megahit and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.2.9
  * - BELL
    - 1.2.9
  * - GAUTSCHI
    - 1.2.9
  * - NEGISHI
    - 1.2.9
  * - SCHOLAR
    - 1.2.9

Commands
~~~~~~~
- megahit

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load megahit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Megahit on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=megahit
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers megahit

    megahit --12 SRR1976948.abundtrim.subset.pe.fq.gz,SRR1977249.abundtrim.subset.pe.fq.gz -o combined
.. _Github: https://github.com/voutcn/megahit
