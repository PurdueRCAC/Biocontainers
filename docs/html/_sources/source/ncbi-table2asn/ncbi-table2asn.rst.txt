.. _backbone-label:

Ncbi-table2asn
==============================

Introduction
~~~~~~~~
table2asn is a command-line program that creates sequence records for submission to GenBank. It uses many of the same functions as Genome Workbench but is driven generally by data files, and the records it produces do not necessarily require additional manual editing before submission to GenBank.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/ncbi-table2asn 
| Home page: https://www.ncbi.nlm.nih.gov/genbank/table2asn/

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
    - 1.26.678
  * - BELL
    - 1.26.678
  * - GAUTSCHI
    - 1.26.678
  * - NEGISHI
    - 1.26.678
  * - SCHOLAR
    - 1.26.678

Commands
~~~~~~~
- table2asn

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ncbi-table2asn

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ncbi-table2asn on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ncbi-table2asn
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ncbi-table2asn
