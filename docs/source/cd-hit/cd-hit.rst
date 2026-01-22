.. _backbone-label:

Cd-hit
==============================

Introduction
~~~~~~~~
Cd-hit is a very widely used program for clustering and comparing protein or nucleotide sequences.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/cd-hit 
| Home page: https://github.com/weizhongli/cdhit

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
    - 4.8.1
  * - BELL
    - 4.8.1
  * - GAUTSCHI
    - 4.8.1
  * - NEGISHI
    - 4.8.1
  * - SCHOLAR
    - 4.8.1

Commands
~~~~~~~
- FET.pl
- cd-hit
- cd-hit-2d
- cd-hit-2d-para.pl
- cd-hit-454
- cd-hit-clstr_2_blm8.pl
- cd-hit-div
- cd-hit-div.pl
- cd-hit-est
- cd-hit-est-2d
- cd-hit-para.pl
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
- make_multi_seq.pl
- plot_2d.pl
- plot_len1.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cd-hit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cd-hit on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=cd-hit
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers cd-hit

        # Your cd-hit workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=cd-hit
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers cd-hit

        # Your cd-hit workflow...

  .. tab-item:: Gautschi-AI or Gilbreth

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p a100        # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=cd-hit
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers cd-hit

        # Your cd-hit workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=cd-hit
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers cd-hit

        # Your cd-hit workflow...
