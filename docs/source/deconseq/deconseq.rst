.. _backbone-label:

Deconseq
==============================

Introduction
~~~~~~~~
DeconSeq: DECONtamination of SEQuence data using a modified version of BWA-SW. The DeconSeq tool can be used to automatically detect and efficiently remove sequence contamination from genomic and metagenomic datasets. It is easily configurable and provides a user-friendly interface.


| For more information, please check:
| Home page: http://deconseq.sourceforge.net/ 

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.4.3
  * - BELL
    - 0.4.3
  * - GAUTSCHI
    - 0.4.3
  * - NEGISHI
    - 0.4.3
  * - SCHOLAR
    - 0.4.3

Commands
~~~~~~~
- bwa64
- deconseq.pl
- splitFasta.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load deconseq

Helper command
~~~~  
.. note::
   Users need to use ``DeconSeqConfig.pm`` to specify the database information. Besides, for the current ``deconseq`` module in `biocontainers`, users need to copy the executables to your current directory, including ``bwa64``, ``deconseq.pl``, and ``splitFasta.pl``. This step is only needed to run once. 
   
A helper command ``copy_DeconSeqConfig`` is provided to copy the configuration file ``DeconSeqConfig.pm`` and executables to your current directory. You just need to run the command ``copy_DeconSeqConfig`` and modify ``DeconSeqConfig.pm`` as needed::


    copy_DeconSeqConfig
    nano DeconSeqConfig.pm # modify database information as needed

For detailed information about how to config ``DeconSeqConfig.pm``, please check its online manual (https://sourceforge.net/projects/deconseq/files/).

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run deconseq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=deconseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers deconseq

    bwa64 index -p hg38_db -a bwtsw Homo_sapiens.GRCh38.dna.fa
    bwa64 index -p m39_db -a bwtsw GRCm38.p4.genome.fa 
    deconseq.pl -f input.fastq -dbs hg38_db -dbs_retain m39_db
