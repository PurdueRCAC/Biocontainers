.. _backbone-label:

ASGAL
==============================

Introduction
~~~~~~~~
``ASGAL`` (Alternative Splicing Graph ALigner) is a tool for detecting the alternative splicing events expressed in a RNA-Seq sample with respect to a gene annotation. 

| For more information, please check its | Docker hub: https://hub.docker.com/r/algolab/asgal and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.1.7
  * - BELL
    - 1.1.7
  * - GAUTSCHI
    - 1.1.7
  * - NEGISHI
    - 1.1.7
  * - SCHOLAR
    - 1.1.7

Commands
~~~~~~~
- asgal

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load asgal

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ASGAL on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=asgal
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers asgal

    asgal -g input/genome.fa \
        -a input/annotation.gtf \
        -s input/sample_1.fa -o outputFolder


.. _Github: https://github.com/AlgoLab/galig
