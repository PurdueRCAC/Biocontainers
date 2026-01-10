.. _backbone-label:

Infernal
==============================

Introduction
~~~~~~~~
Infernal ("INFERence of RNA ALignment") is for searching DNA sequence databases for RNA structure and sequence similarities. It is an implementation of a special case of profile stochastic context-free grammars called covariance models (CMs). A CM is like a sequence profile, but it scores a combination of sequence consensus and RNA secondary structure consensus, so in many cases, it is more capable of identifying RNA homologs that conserve their secondary structure more than their primary sequence.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/infernal 
| Home page: http://eddylab.org/infernal/

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
    - 1.1.4
  * - BELL
    - 1.1.4
  * - GAUTSCHI
    - 1.1.4
  * - NEGISHI
    - 1.1.4
  * - SCHOLAR
    - 1.1.4

Commands
~~~~~~~
- cmalign
- cmbuild
- cmcalibrate
- cmconvert
- cmemit
- cmfetch
- cmpress
- cmscan
- cmsearch
- cmstat

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load infernal

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run infernal on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=infernal
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers infernal
