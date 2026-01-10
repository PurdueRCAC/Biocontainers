.. _backbone-label:

Blast
==============================

Introduction
~~~~~~~~
BLAST (Basic Local Alignment Search Tool) finds regions of similarity between biological sequences. The program compares nucleotide or protein sequences to sequence databases and calculates the statistical significance.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/blast 
| Home page: https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMDWeb&PAGE_TYPEBlastHome

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
    - 2.11.0, 2.13.0
  * - BELL
    - 2.11.0, 2.13.0
  * - GAUTSCHI
    - 2.11.0, 2.13.0
  * - NEGISHI
    - 2.11.0, 2.13.0
  * - SCHOLAR
    - 2.11.0, 2.13.0

Commands
~~~~~~~
- blastn
- blastp
- blastx
- blast_formatter
- amino-acid-composition
- between-two-genes
- blastdbcheck
- blastdbcmd
- blastdb_aliastool
- cleanup-blastdb-volumes.py
- deltablast
- dustmasker
- eaddress
- eblast
- get_species_taxids.sh
- legacy_blast.pl
- makeblastdb
- makembindex
- makeprofiledb
- psiblast
- rpsblast
- rpstblastn
- run-ncbi-converter
- segmasker
- tblastn
- tblastx
- update_blastdb.pl
- windowmasker

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load blast

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run blast on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=blast
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers blast
