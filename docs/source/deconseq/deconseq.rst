.. _backbone-label:

Deconseq
==============================

Introduction
~~~~~~~~
DeconSeq: DECONtamination of SEQuence data using a modified version of BWA-SW. The DeconSeq tool can be used to automatically detect and efficiently remove sequence contamination from genomic and metagenomic datasets. It is easily configurable and provides a user-friendly interface.


| For more information, please check:
| Home page: http://deconseq.sourceforge.net/ Note: A helper command 'copy_DeconSeqConfig' is provided to copy the configuration file DeconSeqConfig.pm and executables to your current directory and modify it as needed. You just need to simply run the command 'copy_DeconSeqConfig', no extra parameter is needed.

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
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

