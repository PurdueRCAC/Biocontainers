.. _backbone-label:

Prinseq
==============================

Introduction
~~~~~~~~
``Prinseq`` is a tool that generates summary statistics of sequence and quality data and that is used to filter, reformat and trim next-generation sequence data. 

| For more information, please check its website: https://biocontainers.pro/tools/prinseq and its home page: http://prinseq.sourceforge.net.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.20.4
  * - BELL
    - 0.20.4
  * - GAUTSCHI
    - 0.20.4
  * - NEGISHI
    - 0.20.4
  * - SCHOLAR
    - 0.20.4

Commands
~~~~~~~
- prinseq-graphs-noPCA.pl
- prinseq-graphs.pl
- prinseq-lite.pl

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load prinseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Prinseq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=prinseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers prinseq

    prinseq-lite.pl -verbose -fastq  SRR5043021_1.fastq -fastq2 SRR5043021_2.fastq -graph_data test.gd -out_good null -out_bad null
    prinseq-graphs.pl -i test.gd -png_all -o test
    prinseq-graphs-noPCA.pl -i test.gd -png_all -o test_noPCA
