.. _backbone-label:

Helen
==============================

Introduction
~~~~~~~~
HELEN is a multi-task RNN polisher which operates on images produced by MarginPolish.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/kishwars/helen 
| Home page: https://github.com/kishwarshafin/helen

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.0
  * - BELL
    - 1.0
  * - GAUTSCHI
    - 1.0
  * - NEGISHI
    - 1.0
  * - SCHOLAR
    - 1.0

Commands
~~~~~~~
- helen

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load helen

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run helen on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 32
    #SBATCH --job-name=helen
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers helen

    helen polish \
        --image_dir mp_output \
        --model_path "helen_modles/HELEN_r941_guppy344_microbial.pkl" \
        --threads 32 \
        --output_dir "helen_output/" \
        --output_prefix Staph_Aur_draft_helen
