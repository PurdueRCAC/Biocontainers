.. _backbone-label:

Adapterremoval
==============================

Introduction
~~~~~~~~
AdapterRemoval searches for and removes adapter sequences from High-Throughput Sequencing (HTS) data and (optionally) trims low quality bases from the 3' end of reads following adapter removal. AdapterRemoval can analyze both single end and paired end data, and can be used to merge overlapping paired-ended reads into (longer) consensus sequences. Additionally, AdapterRemoval can construct a consensus adapter sequence for paired-ended reads, if which this information is not available.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/adapterremoval 
| Home page: https://github.com/MikkelSchubert/adapterremoval

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.3.3
  * - BELL
    - 2.3.3
  * - GAUTSCHI
    - 2.3.3
  * - NEGISHI
    - 2.3.3
  * - SCHOLAR
    - 2.3.3

Commands
~~~~~~~
- AdapterRemoval

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load adapterremoval

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run adapterremoval on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=adapterremoval
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers adapterremoval

    AdapterRemoval --file1 input_1.fastq --file2 input_2.fastq 
