.. _backbone-label:

Marginpolish
==============================

Introduction
~~~~~~~~
MarginPolish is a graph-based assembly polisher. It iteratively finds multiple probable alignment paths for run-length-encoded reads and uses these to generate a refined sequence. It takes as input a FASTA assembly and an indexed BAM (ONT reads aligned to the assembly), and it produces a polished FASTA assembly.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/kishwars/margin_polish 
| Home page: https://github.com/UCSC-nanopore-cgl/MarginPolish

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.1.3
  * - BELL
    - 0.1.3
  * - GAUTSCHI
    - 0.1.3
  * - NEGISHI
    - 0.1.3
  * - SCHOLAR
    - 0.1.3

Commands
~~~~~~~
- marginpolish

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load marginpolish

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run marginpolish on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 32
    #SBATCH --job-name=marginpolish
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers marginpolish
        
    marginpolish \
        Reads_to_assembly_StaphAur.bam \
        Draft_assembly_StaphAur.fasta \
        helen_modles/MP_r941_guppy344_microbial.json \
        -t 32 \
        -o mp_output/mp_images \
        -f
