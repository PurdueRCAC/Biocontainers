.. _backbone-label:

Trinotate
==============================

Introduction
~~~~~~~~
Trinotate is a comprehensive annotation suite designed for automatic functional annotation of transcriptomes, particularly de novo assembled transcriptomes, from model or non-model organisms.


| For more information, please check:
| Home page: https://github.com/Trinotate/Trinotate.github.io/blob/master/index.asciidoc

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
    - 3.2.2
  * - BELL
    - 3.2.2
  * - GAUTSCHI
    - 3.2.2
  * - NEGISHI
    - 3.2.2
  * - SCHOLAR
    - 3.2.2

Commands
~~~~~~~
- Trinotate
- Build_Trinotate_Boilerplate_SQLite_db.pl
- EMBL_dat_to_Trinotate_sqlite_resourceDB.pl
- EMBL_swissprot_parser.pl
- PFAM_dat_parser.pl
- PFAMtoGoParser.pl
- RnammerTranscriptome.pl
- TrinotateSeqLoader.pl
- Trinotate_BLAST_loader.pl
- Trinotate_GO_to_SLIM.pl
- Trinotate_GTF_loader.pl
- Trinotate_GTF_or_GFF3_annot_prep.pl
- Trinotate_PFAM_loader.pl
- Trinotate_RNAMMER_loader.pl
- Trinotate_SIGNALP_loader.pl
- Trinotate_TMHMM_loader.pl
- Trinotate_get_feature_name_encoding_attributes.pl
- Trinotate_report_writer.pl
- assign_eggnog_funccats.pl
- autoTrinotate.pl
- build_DE_cache_tables.pl
- cleanMe.pl
- cleanme.pl
- count_table_fields.pl
- create_clusters_tables.pl
- extract_GO_assignments_from_Trinotate_xls.pl
- extract_GO_for_BiNGO.pl
- extract_specific_genes_from_all_matrices.pl
- import_DE_results.pl
- import_Trinotate_xls_as_annot.pl
- import_expression_and_DE_results.pl
- import_expression_matrix.pl
- import_samples_n_expression_matrix.pl
- import_samples_only.pl
- import_transcript_annotations.pl
- import_transcript_clusters.pl
- import_transcript_names.pl
- init_Trinotate_sqlite_db.pl
- legacy_blast.pl
- make_cXp_html.pl
- obo_tab_to_sqlite_db.pl
- obo_to_tab.pl
- prep_nuc_prot_set_for_trinotate_loading.pl
- print.pl
- rnammer_supperscaffold_gff_to_indiv_transcripts.pl
- runMe.pl
- run_TrinotateWebserver.pl
- run_cluster_functional_enrichment_analysis.pl
- shrink_db.pl
- sqlite.pl
- superScaffoldGenerator.pl
- test_Barplot.pl
- test_GO_DAG.pl
- test_GenomeBrowser.pl
- test_Heatmap.pl
- test_Lineplot.pl
- test_Piechart.pl
- test_Scatter2D.pl
- test_Sunburst.pl
- trinotate_report_summary.pl
- update_blastdb.pl
- update_seq_n_annotation_fields.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load trinotate

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run trinotate on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=trinotate
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers trinotate

        # Your trinotate workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=trinotate
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers trinotate

        # Your trinotate workflow...

  .. tab-item:: Gautschi-AI

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p ai          # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=trinotate
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers trinotate

        # Your trinotate workflow...

  .. tab-item:: Gilbreth

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p a100        # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH --mem=2G       # Memory
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=trinotate
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers trinotate

        # Your trinotate workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=trinotate
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers trinotate

        # Your trinotate workflow...
