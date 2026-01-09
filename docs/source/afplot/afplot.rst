.. _backbone-label:

Afplot
==============================

Introduction
~~~~~~~~
``Afplot`` is a tool to plot allele frequencies in VCF files. 

| For more information, please check its website: https://biocontainers.pro/tools/afplot and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.2.1
  * - BELL
    - 0.2.1
  * - GAUTSCHI
    - 0.2.1
  * - NEGISHI
    - 0.2.1
  * - SCHOLAR
    - 0.2.1

Commands
~~~~~~~
- afplot

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load afplot

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run afplot on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=afplot
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers afplot
    
    afplot whole-genome histogram -v my_vcf.gz -l my_label -s my_sample -o mysample.histogram.png 


.. _Github: https://github.com/sndrtj/afplot
