.. _backbone-label:

Snpeff
==============================

Introduction
~~~~~~~~
``Snpeff`` is an open source tool that annotates variants and predicts their effects on genes by using an interval forest approach. 

| For more information, please check its website: https://biocontainers.pro/tools/snpeff and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 5.1d, 5.1, 5.2
  * - BELL
    - 5.1d, 5.1, 5.2
  * - GAUTSCHI
    - 5.1d, 5.1, 5.2
  * - NEGISHI
    - 5.1d, 5.1, 5.2, 5.3.0a
  * - SCHOLAR
    - 5.1d, 5.1

Commands
~~~~~~~
- snpEff

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load snpeff

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

.. note::
    By default, snpEff only uses ``1gb`` of memory. To allocate larger  memory, add ``-Xmx`` flag in your command.::

        snpeff -Xmx10g ## To allocate 10gb of memory.

To run Snpeff on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=snpeff
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers snpeff

    snpEff GRCh37.75 examples/test.chr22.vcf > test.chr22.ann.vcf
.. _Github: http://pcingola.github.io/SnpEff/
