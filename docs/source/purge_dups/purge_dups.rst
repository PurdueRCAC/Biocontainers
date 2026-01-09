.. _backbone-label:

Purge_dups
==============================

Introduction
~~~~~~~~
purge_dups is designed to remove haplotigs and contig overlaps in a de novo assembly based on read depth.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/purge_dups 
| Home page: https://github.com/dfguan/purge_dups

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.2.6_fixed, 1.2.6
  * - BELL
    - 1.2.6_fixed, 1.2.6
  * - GAUTSCHI
    - 1.2.6
  * - NEGISHI
    - 1.2.6_fixed, 1.2.6
  * - SCHOLAR
    - 1.2.6

Commands
~~~~~~~
- augustify.py
- bamToWig.py
- cleanup-blastdb-volumes.py
- edirect.py
- executeTestCGP.py
- extractAnno.py
- findRepetitiveProtSeqs.py
- fix_in_frame_stop_codon_genes.py
- generate_plot.py
- getAnnoFastaFromJoingenes.py
- hist_plot.py
- pd_config.py
- run_abundance.py
- run_purge_dups.py
- run_sepp.py
- run_tipp.py
- run_tipp_tool.py
- run_upp.py
- split_sequences.py
- stringtie2fa.py
- sumlabels.py
- sumtrees.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load purge_dups

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run purge_dups on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=purge_dups
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers purge_dups
