.. _backbone-label:

Edta
==============================

Introduction
~~~~~~~~
Edta is developed for automated whole-genome de-novo TE annotation and benchmarking the annotation performance of TE libraries. Note: Running EDTA, please use the command like this: EDTA.pl [OPTIONS] DO NOT call it 'perl EDTA.pl'


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/edta 
| Home page: https://github.com/oushujun/EDTA

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
    - 1.9.6, 2.0.0
  * - BELL
    - 1.9.6, 2.0.0
  * - GAUTSCHI
    - 1.9.6, 2.0.0
  * - NEGISHI
    - 1.9.6, 2.0.0
  * - SCHOLAR
    - 1.9.6, 2.0.0

Commands
~~~~~~~
- EDTA.pl
- EDTA_processI.pl
- EDTA_raw.pl
- FET.pl
- bdf2gdfont.pl
- buildRMLibFromEMBL.pl
- buildSummary.pl
- calcDivergenceFromAlign.pl
- cd-hit-2d-para.pl
- cd-hit-clstr_2_blm8.pl
- cd-hit-div.pl
- cd-hit-para.pl
- check_result.pl
- clstr2tree.pl
- clstr2txt.pl
- clstr2xml.pl
- clstr_cut.pl
- clstr_list.pl
- clstr_list_sort.pl
- clstr_merge.pl
- clstr_merge_noorder.pl
- clstr_quality_eval.pl
- clstr_quality_eval_by_link.pl
- clstr_reduce.pl
- clstr_renumber.pl
- clstr_rep.pl
- clstr_reps_faa_rev.pl
- clstr_rev.pl
- clstr_select.pl
- clstr_select_rep.pl
- clstr_size_histogram.pl
- clstr_size_stat.pl
- clstr_sort_by.pl
- clstr_sort_prot_by.pl
- clstr_sql_tbl.pl
- clstr_sql_tbl_sort.pl
- convert_MGEScan3.0.pl
- convert_ltr_struc.pl
- convert_ltrdetector.pl
- createRepeatLandscape.pl
- down_tRNA.pl
- dupliconToSVG.pl
- filter_rt.pl
- genome_plot.pl
- genome_plot2.pl
- genome_plot_svg.pl
- getRepeatMaskerBatch.pl
- legacy_blast.pl
- lib-test.pl
- make_multi_seq.pl
- maskFile.pl
- plot_2d.pl
- plot_len1.pl
- rmOut2Fasta.pl
- rmOutToGFF3.pl
- rmToUCSCTables.pl
- update_blastdb.pl
- viewMSA.pl
- wublastToCrossmatch.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load edta

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run edta on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=edta
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers edta

        # Your edta workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=edta
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers edta

        # Your edta workflow...

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
        #SBATCH --job-name=edta
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers edta

        # Your edta workflow...

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
        #SBATCH --job-name=edta
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers edta

        # Your edta workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=edta
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers edta

        # Your edta workflow...
