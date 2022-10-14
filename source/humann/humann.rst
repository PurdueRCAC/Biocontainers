.. _backbone-label:

HUMAnN 3
==============================

Introduction
~~~~~~~
``HUMAnN 3.0`` is the next iteration of HUMAnN, the HMP Unified Metabolic Analysis Network. HUMAnN is a method for efficiently and accurately profiling the abundance of microbial metabolic pathways and other molecular functions from metagenomic or metatranscriptomic sequencing data. | For more information please check its website: https://huttenhower.sph.harvard.edu/humann/

Versions
~~~~~~~~
- 3.0.0

Commands
~~~~~~~
- humann  
- humann3  
- humann3_databases
- humann_barplot
- humann_benchmark
- humann_build_custom_database
- humann_config
- humann_databases
- humann_genefamilies_genus_level
- humann_infer_taxonomy
- humann_join_tables
- humann_reduce_table
- humann_regroup_table
- humann_rename_table
- humann_renorm_table
- humann_split_stratified_table
- humann_split_table
- humann_test  
- humann_unpack_pathways

Database  
~~~~~~
Full ChocoPhlAn, UniRef90, EC-filtered UniRef90, UniRef50, EC-filtered UniRef50, and utility_mapping databases have been downloaded for users.  

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load humann/3.0.0 

Example job
~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run HUMAnN3 on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=humann
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers humann/3.0.0 
    # Check the database and config by: 
    humann_config --print
    
    humann --threads 24 --input examples/demo.fastq --output demo_output --metaphlan-options "--bowtie2db /depot/itap/datasets/metaphlan"


    

    
