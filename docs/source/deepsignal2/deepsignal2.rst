.. _backbone-label:

Deepsignal2
==============================

Introduction
~~~~~~~~
Deepsignal2 is a deep-learning method for detecting DNA methylation state from Oxford Nanopore sequencing reads.


| For more information, please check:
| Home page: https://github.com/PengNi/deepsignal2

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
    - 0.1.2
  * - BELL
    - 0.1.2
  * - GAUTSCHI
    - 0.1.2
  * - NEGISHI
    - 0.1.2
  * - SCHOLAR
    - 0.1.2

Commands
~~~~~~~
- deepsignal2
- call_modification_frequency.py
- combine_call_mods_freq_files.py
- combine_two_strands_frequency.py
- concat_two_files.py
- evaluate_mods_call.py
- filter_samples_by_label.py
- filter_samples_by_positions.py
- gff_reader.py
- randsel_file_rows.py
- shuffle_a_big_file.py
- split_freq_file_by_5mC_motif.py
- txt_formater.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load deepsignal2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run deepsignal2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=deepsignal2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers deepsignal2
