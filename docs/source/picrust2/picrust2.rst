.. _backbone-label:

Picrust2
==============================

Introduction
~~~~~~~~
``Picrust2`` is a software for predicting functional abundances based only on marker gene sequences. 

| For more information, please check its website: https://biocontainers.pro/tools/picrust2 and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.4.2, 2.5.0
  * - BELL
    - 2.4.2, 2.5.0
  * - GAUTSCHI
    - 2.4.2, 2.5.0
  * - NEGISHI
    - 2.4.2, 2.5.0
  * - SCHOLAR
    - 2.4.2, 2.5.0

Commands
~~~~~~~
- add_descriptions.py
- convert_table.py
- hsp.py
- metagenome_pipeline.py
- pathway_pipeline.py
- picrust2_pipeline.py
- place_seqs.py
- print_picrust2_config.py
- run_abundance.py
- run_sepp.py
- run_tipp.py
- run_tipp_tool.py
- run_upp.py
- shuffle_predictions.py
- split_sequences.py
- sumlabels.py
- sumtrees.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load picrust2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Picrust2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 10
    #SBATCH --job-name=picrust2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers picrust2


    place_seqs.py -s ../seqs.fna -o out.tre -p 10 \
              --intermediate intermediate/place_seqs

    hsp.py -i 16S -t out.tre -o marker_predicted_and_nsti.tsv.gz -p 10 -n

    hsp.py -i EC -t out.tre -o EC_predicted.tsv.gz -p 10

    metagenome_pipeline.py -i ../table.biom -m marker_predicted_and_nsti.tsv.gz -f EC_predicted.tsv.gz -o EC_metagenome_out --strat_out 

    convert_table.py EC_metagenome_out/pred_metagenome_contrib.tsv.gz \
                 -c contrib_to_legacy \
                 -o EC_metagenome_out/pred_metagenome_contrib.legacy.tsv.gz

    pathway_pipeline.py -i EC_metagenome_out/pred_metagenome_contrib.tsv.gz \
                    -o pathways_out -p 10

    add_descriptions.py -i EC_metagenome_out/pred_metagenome_unstrat.tsv.gz -m EC \
                    -o EC_metagenome_out/pred_metagenome_unstrat_descrip.tsv.gz


    add_descriptions.py -i pathways_out/path_abun_unstrat.tsv.gz -m METACYC \
                    -o pathways_out/path_abun_unstrat_descrip.tsv.gz

    picrust2_pipeline.py -s chemerin_16S/seqs.fna -i chemerin_16S/table.biom \
        -o picrust2_out_pipeline -p 10
.. _Github: https://github.com/picrust/picrust2
