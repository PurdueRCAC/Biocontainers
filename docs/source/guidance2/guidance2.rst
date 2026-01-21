.. _backbone-label:

Guidance2
==============================

Introduction
~~~~~~~~
GUIDe Tree Based AligNment ConfidencE (GUIDANCE) is a software package for aligning biological sequences (DNA or amino acids) using either MAFFT, PRANK, or CLUSTALW, and calculating confidence scores for each column, sequence and residue in the alignment.


| For more information, please check:
| BioContainers: https://hub.docker.com/repository/docker/arnstrm2/guidance2/general 
| Home page: https://taux.evolseq.net/guidancever2/source.php

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

  * - BELL
    - 2.02
  * - NEGISHI
    - 2.02

Commands
~~~~~~~
- Create_Chimera_Figure_Files_For_ConSurfDB.pl
- Create_PyMol_Files_For_ConSurfDB.pl
- HoT_COS_GUIDANCE2.pl
- Monitor_Bioseq_Node.pl
- Remove_Pos_bellow_Cutoff.pl
- Remove_Seq_bellow_Cutoff.pl
- Replace_B_Factor_With_ConSurf_Grade.pl
- blastpgp_to_fasta.pl
- calculate_statistics.pl
- checkjob.pl
- cluster.pl
- code2nameFasta.pl
- code2nameTree.pl
- colorCoding.v2.pl
- colorCodingLinear.pl
- convertBSTrees2MafftFormat.pl
- convertNacessFormat.pl
- create_MSA_from_blast.pl
- create_chimerx.pl
- create_colored_chimera_msa.pl
- daemon.pl
- extract_info_from_pdb.pl
- failedCheck.pl
- guidance.pl
- isEqualTree
- maskLowScoreResidues.pl
- msa_set_score
- name2codeFastaFrom1.pl
- printColoredAlignment.pl
- pullOutBStrees.pl
- r4s_res_to_gradesPE.pl
- removeLowSPsites.pl
- removeTaxa
- remove_old_results.pl
- rootTree.pl
- runAlignBStrees.pl
- selecton_run_calc.pl
- semphy
- sendEmail.pl
- statTest.pl
- test_time.pl
- update_runTime.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load guidance2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run guidance2 on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=guidance2
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers guidance2

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=guidance2
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers guidance2

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
        #SBATCH --job-name=guidance2
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers guidance2

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=guidance2
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers guidance2
