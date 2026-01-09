.. _backbone-label:

Bowtie 2
==============================

Introduction
~~~~~~~~
``Bowtie 2``is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences. It is particularly good at aligning reads of about 50 up to 100s or 1,000s of characters, and particularly good at aligning to relatively long (e.g. mammalian) genomes. Bowtie 2 indexes the genome with an FM Index to keep its memory footprint small: for the human genome, its memory footprint is typically around 3.2 GB. Bowtie 2 supports gapped, local, and paired-end alignment modes. 

| For more information, please check its website: https://biocontainers.pro/tools/bowtie2 and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.4.2, 2.5.1
  * - BELL
    - 2.4.2, 2.5.1
  * - GAUTSCHI
    - 2.4.2, 2.5.1
  * - NEGISHI
    - 2.4.2, 2.5.1
  * - SCHOLAR
    - 2.4.2, 2.5.1

Commands
~~~~~~~
- bowtie2
- bowtie2-build
- bowtie2-inspect

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bowtie2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bowtie 2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bowtie2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bowtie2

    bowtie2-build ref.fasta ref
    bowtie2 -p 4 -x ref -1 input_1.fq -2 input_2.fq -S test.sam

.. _Github: https://github.com/BenLangmead/bowtie2
