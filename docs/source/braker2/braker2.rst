.. _backbone-label:

Braker2
==============================

Introduction
~~~~~~~~
BRAKER is a pipeline for fully automated prediction of protein coding gene structures with GeneMark-ES/ET and AUGUSTUS in novel eukaryotic genomes.


| For more information, please check:
| Home page: https://github.com/Gaius-Augustus/BRAKER Note: Since BRAKER is a pipeline that trains AUGUSTUS, i.e. writes species specific parameter files, BRAKER needs writing access to the configuration directory of AUGUSTUS that contains such files. This installation comes with a stub of AUGUSTUS coniguration files, but you *must* copy them out from the container into a location where you have write permissions. A helper command 'copy_augustus_config' is provided to simplify the task. Follow the procedure below to put the config files in your scratch space: $ mkdir -p $RCAC_SCRATCH/augustus $ copy_augustus_config $RCAC_SCRATCH/augustus $ export AUGUSTUS_CONFIG_PATH$RCAC_SCRATCH/augustus/config You would also pass the value via command-line switch: $ braker.pl --AUGUSTUS_CONFIG_PATH$RCAC_SCRATCH/augustus/config .....

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.1.6

Commands
~~~~~~~
- braker.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load braker2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run braker2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=braker2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers braker2

