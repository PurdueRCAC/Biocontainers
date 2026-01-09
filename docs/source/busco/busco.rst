.. _backbone-label:

Busco
==============================

Introduction
~~~~~~~~
BUSCO (Benchmarking sets of Universal Single-Copy Orthologs) provides measures for quantitative assessment of genome assembly, gene set, and transcriptome completeness based on evolutionarily informed expectations of gene content from near-universal single-copy orthologs. Note: to plot BUSCO summary results, use the companion command: generate_plot.py -wd [WORKING_DIRECTORY] [OTHER OPTIONS] The plotting script is installed as a standalone executable and can be invoked directly as above. DO NOT call it 'python3 scripts/generate_plot.py' (as the user manual at https://busco.ezlab.org/busco_userguide.html#plot suggests). This change is specific to the way this container is organized.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/ezlabgva/busco 
| Home page: https://gitlab.com/ezlab/busco/ Note: Augustus is a gene prediction program for eukaryotes which is required by BUSCO. Augustus requires a writable configuration directory. This installation comes with a stub of AUGUSTUS coniguration files, but you *must* copy them out from the container into a location where you have write permissions. A helper command 'copy_augustus_config' is provided to simplify the task. Follow the procedure below to put the config files in your scratch space: $ mkdir -p $RCAC_SCRATCH/augustus $ copy_augustus_config $RCAC_SCRATCH/augustus $ export AUGUSTUS_CONFIG_PATH$RCAC_SCRATCH/augustus/config

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 5.2.2
- 5.3.0
- 5.4.1
- 5.4.3
- 5.4.4
- 5.4.5
- 5.4.7

Commands
~~~~~~~
- busco
- generate_plot.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load busco

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run busco on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=busco
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers busco

