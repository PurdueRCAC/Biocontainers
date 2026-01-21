.. _backbone-label:

Perl-bioperl
==============================

Introduction
~~~~~~~~
BioPerl is a collection of Perl modules that facilitate the development of Perl scripts for bioinformatics applications. It provides software modules for many of the typical tasks of bioinformatics programming.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/perl-bioperl 
| Home page: ########################

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
    - 1.7.2-pl526
  * - BELL
    - 1.7.2-pl526
  * - GAUTSCHI
    - 1.7.2-pl526
  * - NEGISHI
    - 1.7.2-pl526
  * - SCHOLAR
    - 1.7.2-pl526

Commands
~~~~~~~
- SOAPsh.pl
- ace.pl
- bam2bedgraph
- bamToGBrowse.pl
- bdf2gdfont.pl
- bdftogd
- binhex.pl
- bp_aacomp.pl
- bp_biofetch_genbank_proxy.pl
- bp_bioflat_index.pl
- bp_biogetseq.pl
- bp_blast2tree.pl
- bp_bulk_load_gff.pl
- bp_chaos_plot.pl
- bp_classify_hits_kingdom.pl
- bp_composite_LD.pl
- bp_das_server.pl
- bp_dbsplit.pl
- bp_download_query_genbank.pl
- bp_extract_feature_seq.pl
- bp_fast_load_gff.pl
- bp_fastam9_to_table.pl
- bp_fetch.pl
- bp_filter_search.pl
- bp_find-blast-matches.pl
- bp_flanks.pl
- bp_gccalc.pl
- bp_genbank2gff.pl
- bp_genbank2gff3.pl
- bp_generate_histogram.pl
- bp_heterogeneity_test.pl
- bp_hivq.pl
- bp_hmmer_to_table.pl
- bp_index.pl
- bp_load_gff.pl
- bp_local_taxonomydb_query.pl
- bp_make_mrna_protein.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load perl-bioperl

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run perl-bioperl on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=perl-bioperl
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers perl-bioperl

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=perl-bioperl
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers perl-bioperl

   .. tab-item:: Gautschi-AI/Gilbreth

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p a100        # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=perl-bioperl
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers perl-bioperl

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=perl-bioperl
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers perl-bioperl
