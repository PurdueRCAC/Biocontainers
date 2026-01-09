.. _backbone-label:

Barrnap
==============================

Introduction
~~~~~~~~
``Barrnap``: BAsic Rapid Ribosomal RNA Predictor. 

| For more information, please check its website: https://biocontainers.pro/tools/barrnap and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.9.4
  * - BELL
    - 0.9.4
  * - GAUTSCHI
    - 0.9.4
  * - NEGISHI
    - 0.9.4
  * - SCHOLAR
    - 0.9.4

Commands
~~~~~~~
- barrnap

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load barrnap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Barrnap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=barrnap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers barrnap

    barrnap --kingdom bac -o bac_16s.fasta < bac_genome.fasta > bac_16s.gff3
    barrnap --kingdom euk -o euk_16s.fasta < euk_genome.fasta  > euk_16s.gff3

.. _Github: https://github.com/tseemann/barrnap

