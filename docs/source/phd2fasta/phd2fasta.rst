.. _backbone-label:

Phd2fasta
==============================

Introduction
~~~~~~~~
``Phd2fasta`` is a tool to convert Phred ‘phd’ format files to ‘fasta’ format. 

| For more information, please check its home page: http://www.phrap.org/phredphrapconsed.html.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.990622
  * - BELL
    - 0.990622
  * - GAUTSCHI
    - 0.990622
  * - NEGISHI
    - 0.990622
  * - SCHOLAR
    - 0.990622

Commands
~~~~~~~
- phd2fasta

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load phd2fasta

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Phd2fasta on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=phd2fasta
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers phd2fasta
