.. _backbone-label:  

Prokka
============================== 

Introduction
~~~~~~~
``Prokka`` is a pipeline for rapidly annotating prokaryotic genomes. It produces GFF3, GBK and SQN files that are ready for editing in Sequin and ultimately submitted to Genbank/DDJB/ENA.

Detailed usage can be found here: https://github.com/tseemann/prokka


Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.14.6
  * - BELL
    - 1.14.6
  * - GAUTSCHI
    - 1.14.6
  * - NEGISHI
    - 1.14.6
  * - SCHOLAR
    - 1.14.6

Commands
~~~~~~
- prokka
- prokka-abricate_to_fasta_db
- prokka-biocyc_to_fasta_db
- prokka-build_kingdom_dbs
- prokka-cdd_to_hmm
- prokka-clusters_to_hmm
- prokka-genbank_to_fasta_db
- prokka-genpept_to_fasta_db
- prokka-hamap_to_hmm
- prokka-tigrfams_to_hmm
- prokka-uniprot_to_fasta_db


Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load prokka 

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run prokka on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=prokka
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers prokka
    
    prokka --compliant --centre UoN --outdir PRJEB12345 --locustag EHEC --prefix EHEC-Chr1 contigs.fa  --cpus 24
    prokka-genbank_to_fasta_db Coccus1.gbk Coccus2.gbk Coccus3.gbk Coccus4.gbk > Coccus.faa 
