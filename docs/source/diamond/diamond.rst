.. _backbone-label:  

Diamond
============================== 

Introduction
~~~~~~~
``Diamond`` is a sequence aligner for protein and translated DNA searches, designed for high performance analysis of big sequence data. The key features are:  

- Pairwise alignment of proteins and translated DNA at 100x-10,000x speed of BLAST.
- Frameshift alignments for long read analysis.
- Low resource requirements and suitable for running on standard desktops or laptops.
- Various output formats, including BLAST pairwise, tabular and XML, as well as taxonomic classification.

Detailed about its usage can be found here: https://github.com/bbuchfink/diamond

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.0.13, 2.0.14, 2.0.15, 2.1.6
  * - BELL
    - 2.0.13, 2.0.14, 2.0.15, 2.1.6
  * - GAUTSCHI
    - 2.0.13, 2.0.14, 2.0.15, 2.1.6
  * - NEGISHI
    - 2.0.13, 2.0.14, 2.0.15, 2.1.6
  * - SCHOLAR
    - 2.0.13, 2.0.14, 2.0.15, 2.1.6

Commands
~~~~~~
- diamond makedb 
- diamond prepdb
- diamond blastp
- diamond blastx
- diamond view
- diamond version
- diamond dbinfo
- diamond help
- diamond test

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load diamond/2.0.14

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run diamond on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=diamond
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers diamond/2.0.14
    
    diamond makedb  --in uniprot_sprot.fasta -d uniprot_sprot
    diamond blastp -p 24 -q test.faa -d uniprot_sprot  --very-sensitive -o blastp_output.txt
