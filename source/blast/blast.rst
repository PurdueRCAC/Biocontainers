.. _backbone-label:

BLAST
==============================

Introduction
~~~~~~~~
``BLAST`` (Basic Local Alignment Search Tool) finds regions of similarity between biological sequences. The program compares nucleotide or protein sequences to sequence databases and calculates the statistical significance. For more information, please check its website: https://biocontainers.pro/tools/blast and its home page: https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastHome.

Versions
~~~~~~~~
- 2.11.0
- 2.13.0

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

BLAST Databases
~~~~
Local copies of the blast dabase can be found in the directory **/depot/itap/datasets/blast/latest/**. The environment varialbe ``BLASTDB`` was also set as ``/depot/itap/datasets/blast/latest/``. If users want to use ``cdd_delta``, ``env_nr``, ``env_nt``, ``nr``, ``nt``, ``pataa``, ``patnt``, ``pdbnt``,  ``refseq_protein``, ``refseq_rna``, ``swissprot``, or ``tsa_nt`` databases, do not need to provide the database path. Instead, just use the format like this ``-db nr``. 

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run BLAST on our clusters::

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

    blastp -query protein.fasta -db nr -out test_out -num_threads 4    
