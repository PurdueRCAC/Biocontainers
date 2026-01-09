.. _backbone-label:

CNVkit
==============================

Introduction
~~~~~~~~
``CNVkit`` is a command-line toolkit and Python library for detecting copy number variants and alterations genome-wide from high-throughput sequencing. 

| For more information, please check its website: https://biocontainers.pro/tools/cnvkit and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.9.9-py
  * - BELL
    - 0.9.9-py
  * - GAUTSCHI
    - 0.9.9-py
  * - NEGISHI
    - 0.9.9-py
  * - SCHOLAR
    - 0.9.9-py

Commands
~~~~~~~
- cnvkit.py
- cnv_annotate.py
- cnv_expression_correlate.py
- cnv_updater.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load cnvkit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run CNVkit on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cnvkit
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cnvkit

    cnvkit.py batch *Tumor.bam --normal *Normal.bam \
                    --targets my_baits.bed --fasta hg19.fasta \
                    --access data/access-5kb-mappable.hg19.bed \
                    --output-reference my_reference.cnn
                    --output-dir example/
.. _Github: https://github.com/etal/cnvkit
