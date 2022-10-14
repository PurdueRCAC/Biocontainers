.. _backbone-label:

BRAKER
==============================

Introduction
~~~~~~~
``BRAKER`` is a pipeline for fully automated prediction of protein coding gene structures with GeneMark-ES/ET and AUGUSTUS in novel eukaryotic genomes. | For more information. please check its github repository https://github.com/Gaius-Augustus/BRAKER. 

Versions
~~~~~~~~
- 2.1.6

Commands
~~~~~~  
braker.pl

Helper command
~~~~~  
.. note::
  Since ``BRAKER`` is a pipeline that trains ``AUGUSTUS``, i.e. writes species specific parameter files, BRAKER needs writing access to the configuration directory of AUGUSTUS that contains such files.  This installation comes with a stub of AUGUSTUS coniguration files, but you ``must`` copy them out from the container into a location where you have write permissions.

A helper command ``copy_augustus_config`` is provided to simplify the task. Follow the procedure below to put the config files in your scratch space::

   $ mkdir -p $RCAC_SCRATCH/augustus
   $ copy_augustus_config $RCAC_SCRATCH/augustus
   $ export AUGUSTUS_CONFIG_PATH=$RCAC_SCRATCH/augustus/config

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load braker2/2.1.6 

Example job
~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run BRAKER on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=BRAKER2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers braker2/2.1.6 
    
    # The augustus config step is only required for the first time to use BRAKER2
    mkdir -p $RCAC_SCRATCH/augustus
    copy_augustus_config $RCAC_SCRATCH/augustus
    export AUGUSTUS_CONFIG_PATH=$RCAC_SCRATCH/augustus/config
      
    braker.pl --genome genome.fa --bam RNAseq.bam --softmasking --cores 24
    

     
    

    
