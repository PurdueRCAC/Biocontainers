.. _backbone-label:

Alphafold
==============================

Introduction
~~~~~~~~
``Alphafold`` is a protein structure prediction tool developed by DeepMind (Google). It uses a novel machine learning approach to predict 3D protein structures from primary sequences alone. The source code is available on `Github`_. It has been deployed in all RCAC clusters, supporting both CPU and GPU.   

It also relies on a huge database. The full database (~2.2TB) has been downloaded and setup for users.  

Versions
~~~~~~~~
- 2.1.1
- 2.2.0
- 2.2.3

Commands
~~~~~~~
run_alphafold.sh

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load alphafold/2.1.1

Usage
~~~~~~~~
The usage of Alphafold on our cluster is very straightford::

   run_alphafold.sh --flagfile=$AlphaDB --fasta_paths=XX --output_dir=XX ...

``$AlphaDB`` (/depot/itap/datasets/alphafold/full_db.ff) is a configuration file passed to AlphaFold containing the location of the database. Typically it should not be edited. Users can add other parameters based on your needs.  

Users can check its detaied user guide in its `Github`_. 

AlphaDB
~~~~~~~
Contents of $AlphaDB::

  --db_preset=full_dbs
  --bfd_database_path=/depot/itap/datasets/alphafold/db/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt
  --data_dir=/depot/itap/datasets/alphafold/db/
  --uniref90_database_path=/depot/itap/datasets/alphafold/db/uniref90/uniref90.fasta
  --mgnify_database_path=/depot/itap/datasets/alphafold/db/mgnify/mgy_clusters_2018_12.fa
  --uniclust30_database_path=/depot/itap/datasets/alphafold/db/uniclust30/uniclust30_2018_08/uniclust30_2018_08
  --pdb70_database_path=/depot/itap/datasets/alphafold/db/pdb70/pdb70
  --template_mmcif_dir=/depot/itap/datasets/alphafold/db/pdb_mmcif/mmcif_files
  --max_template_date=2022-01-29
  --obsolete_pdbs_path=/depot/itap/datasets/alphafold/db/pdb_mmcif/obsolete.dat
  --hhblits_binary_path=/usr/bin/hhblits
  --hhsearch_binary_path=/usr/bin/hhsearch
  --jackhmmer_binary_path=/usr/bin/jackhmmer
  --kalign_binary_path=/usr/bin/kalign

Example job using CPU
~~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run alphafold using CPU::
    
    #!/bin/bash
    #SBATCH -A myallocation	# Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=alphafold
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers alphafold/2.1.1
    
    run_alphafold.sh  --flagfile=$AlphaDB --fasta_paths=/scratch/bell/zhan4429/Containers4/alphafold/sample.fasta --max_template_date=2022-02-01 \
    --output_dir=/scratch/bell/zhan4429/Containers4/alphafold/af2_full --model_preset=monomer

Example job using GPU
~~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run alphafold using GPU::
    
    #!/bin/bash
    #SBATCH -A myallocation	# Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --gres=gpu:1
    #SBATCH --job-name=alphafold
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers alphafold/2.1.1
    
    run_alphafold.sh  --flagfile=$AlphaDB --fasta_paths=/scratch/bell/zhan4429/Containers4/alphafold/sample.fasta --max_template_date=2022-02-01 \
    --output_dir=/scratch/bell/zhan4429/Containers4/alphafold/af2_full --model_preset=monomer


.. _Github: https://github.com/deepmind/alphafold/
