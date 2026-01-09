.. _backbone-label:

Raven-assembler
==============================

Introduction
~~~~~~~~
``Raven-assembler`` is a de novo genome assembler for long uncorrected reads. 

| For more information, please check its website: https://biocontainers.pro/tools/raven-assembler and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - .8.1, 1.8.1
  * - BELL
    - .8.1, 1.8.1
  * - GAUTSCHI
    - .8.1, 1.8.1
  * - NEGISHI
    - .8.1, 1.8.1
  * - SCHOLAR
    - .8.1, 1.8.1

Commands
~~~~~~~
- raven

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load raven-assembler

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Raven-assembler on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=raven-assembler
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers raven-assembler

    raven -t 12 input.fastq
.. _Github: https://github.com/lbcb-sci/raven
