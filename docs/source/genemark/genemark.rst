.. _backbone-label:

Genemark
==============================

Introduction
~~~~~~~~
GeneMark-ES/ET/EP is package including GeneMark-ES, GeneMark-ET and GeneMark-EP+ algorithms.


| For more information, please check:
| The users need to download your own licence key from GeneMark website and copy key "gm_key" into users' home directory as: cp gm_key ~/.gm_key Home page: http://opal.biology.gatech.edu/GeneMark/

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
    - 4.68, 4.69
  * - BELL
    - 4.68, 4.69
  * - GAUTSCHI
    - 4.68, 4.69
  * - NEGISHI
    - 4.68, 4.69
  * - SCHOLAR
    - 4.68, 4.69

Commands
~~~~~~~
- bed_to_gff.pl
- bp_seq_select.pl
- build_mod.pl
- calc_introns_from_gtf.pl
- change_path_in_perl_scripts.pl
- compare_intervals_exact.pl
- gc_distr.pl
- get_below_gc.pl
- get_sequence_from_GTF.pl
- gmes_petap.pl
- hc_exons2hints.pl
- histogram.pl
- make_nt_freq_mat.pl
- parse_by_introns.pl
- parse_ET.pl
- parse_gibbs.pl
- parse_set.pl
- predict_genes.pl
- reformat_gff.pl
- rescale_gff.pl
- rnaseq_introns_to_gff.pl
- run_es.pl
- run_hmm_pbs.pl
- scan_for_bp.pl
- star_to_gff.pl
- verify_evidence_gmhmm.pl
- gmhmme3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load genemark

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run genemark on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=genemark
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers genemark

        # Your genemark workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=genemark
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers genemark

        # Your genemark workflow...

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
        #SBATCH --job-name=genemark
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers genemark

        # Your genemark workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=genemark
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers genemark

        # Your genemark workflow...
