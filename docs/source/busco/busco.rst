.. _backbone-label:

BUSCO
==============================

Introduction
~~~~~~~
``BUSCO`` (Benchmarking sets of Universal Single-Copy Orthologs) provides measures for quantitative assessment of genome assembly, gene set, and transcriptome completeness based on evolutionarily informed expectations of gene content from near-universal single-copy orthologs.  

Detailed information can be found here: https://gitlab.com/ezlab/busco/

Versions
~~~~~~~~
- 5.2.2
- 5.3.0
- 5.4.1

Commands
~~~~~~  
- busco
- generate_plot.py

Helper command
~~~~~  
.. note::
  Augustus is a gene prediction program for eukaryotes which is required by BUSCO. Augustus requires a writable configuration directory. This installation comes with a stub of AUGUSTUS coniguration files, but you ``must`` copy them out from the container into a location where you have write permissions.

A helper command ``copy_augustus_config`` is provided to simplify the task. Follow the procedure below to put the config files in your scratch space::

   $ mkdir -p $RCAC_SCRATCH/augustus
   $ copy_augustus_config $RCAC_SCRATCH/augustus
   $ export AUGUSTUS_CONFIG_PATH=$RCAC_SCRATCH/augustus/config

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load busco 


Example job for prokaryotic genomes
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run BUSCO on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=BUSCO
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers busco
    
    ## Print the full lineage datasets, and find the dataset fitting your organism. 
    busco --list-datasets
    
    ## run the evaluation
    busco -f -c 12 -l actinobacteria_class_odb10  -i bacteria_genome.fasta -o busco_out -m genome
    
    ## generate a simple summary plot
    generate_plot.py -wd busco_out

Example job for eukaryotic genomes
~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run BUSCO on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=BUSCO
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers busco
    
    ## The augustus config step is only required for the first time to use BUSCO
    mkdir -p $RCAC_SCRATCH/augustus
    copy_augustus_config $RCAC_SCRATCH/augustus
    
    ## This is required for eukaryotic genomes 
    export AUGUSTUS_CONFIG_PATH=$RCAC_SCRATCH/augustus/config
      
    ## Print the full lineage datasets, and find the dataset fitting your organism. 
    busco --list-datasets
    
    ## run the evaluation
    busco -f -c 12 -l fungi_odb10 -i fungi_protein.fasta -o busco_out_protein  -m protein
    busco -f -c 12 --augustus -l fungi_odb10 -i fungi_genome.fasta -o busco_out_genome  -m genome
    
    ## generate a simple summary plot
    generate_plot.py -wd busco_out_protein
    generate_plot.py -wd busco_out_genome
