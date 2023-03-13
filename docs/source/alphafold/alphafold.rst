.. _backbone-label:

Alphafold
==============================

Introduction
~~~~~~~~
``Alphafold`` is a protein structure prediction tool developed by DeepMind (Google). It uses a novel machine learning approach to predict 3D protein structures from primary sequences alone. The source code is available on `Github`_. It has been deployed in all RCAC clusters, supporting both CPU and GPU.   

It also relies on a huge database. The full database (~2.2TB) has been downloaded and setup for users.  

Protein struction prediction by alphafold is performed in the following steps:

* Search the amino acid sequence in uniref90 database by jackhmmer (using CPU)
* Search the amino acid sequence in  mgnify database by jackhmmer (using CPU)
* Search the amino acid sequence in pdb70 database (for monomers) or pdb_seqres database (for multimers) by hhsearch (using CPU)
* Search the amino acid sequence in bfd database and uniclust30 (updated to uniref30 since v2.3.0) database by hhblits (using CPU)
* Search structure templates in pdb_mmcif database (using CPU)
* Search the amino acid sequence in uniprot database (for multimers) by jackhmmer (using CPU)
* Predict 3D structure by machine learning (using CPU or GPU)
* Structure optimisation with OpenMM (using CPU or GPU)

Versions
~~~~~~~~
- 2.1.1
- 2.2.0
- 2.2.3
- 2.3.0
- 2.3.1

Commands
~~~~~~~
run_alphafold.sh

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load alphafold

Usage
~~~~~~~~
The usage of Alphafold on our cluster is very straightford, users can create a flagfile containing the database path information::

   run_alphafold.sh --flagfile=full_db.ff --fasta_paths=XX --output_dir=XX ...

Users can check its detaied user guide in its `Github`_. 

full_db.ff 
~~~~~~~~~~~
Example contents of full_db.ff::

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

.. note::
   Since Version v2.2.0, the AlphaFold-Multimer model parameters has been updated. The updated full database is stored in ``depot/itap/datasets/alphafold/db_20221014``. For ACCESS Anvil, the database  is stored in ``/anvil/datasets/alphafold/db_20221014``. Users need to update the flagfile using the updated database::
        
        run_alphafold.sh --flagfile=full_db_20221014.ff --fasta_paths=XX --output_dir=XX ...


full_db_20221014.ff (for alphafold v2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Example contents of full_db_20221014.ff (For ACCESS Anvil, please change ``depot/itap`` to ``anvil``)::

  --db_preset=full_dbs
  --bfd_database_path=/depot/itap/datasets/alphafold/db_20221014/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt
  --data_dir=/depot/itap/datasets/alphafold/db_20221014/
  --uniref90_database_path=/depot/itap/datasets/alphafold/db_20221014/uniref90/uniref90.fasta
  --mgnify_database_path=/depot/itap/datasets/alphafold/db_20221014/mgnify/mgy_clusters_2018_12.fa
  --uniclust30_database_path=/depot/itap/datasets/alphafold/db_20221014/uniclust30/uniclust30_2018_08/uniclust30_2018_08
  --pdb_seqres_database_path=/depot/itap/datasets/alphafold/db_20221014/pdb_seqres/pdb_seqres.txt
  --uniprot_database_path=/depot/itap/datasets/alphafold/db_20221014/uniprot/uniprot.fasta
  --template_mmcif_dir=/depot/itap/datasets/alphafold/db_20221014/pdb_mmcif/mmcif_files
  --obsolete_pdbs_path=/depot/itap/datasets/alphafold/db_20221014/pdb_mmcif/obsolete.dat
  --hhblits_binary_path=/usr/bin/hhblits
  --hhsearch_binary_path=/usr/bin/hhsearch
  --jackhmmer_binary_path=/usr/bin/jackhmmer
  --kalign_binary_path=/usr/bin/kalign

.. note::
      Since Version v2.3.0, the AlphaFold-Multimer model parameters has been updated. The updated full database is stored in ``depot/itap/datasets/alphafold/db_20230311``. For ACCESS Anvil, the database  is stored in ``/anvil/datasets/alphafold/db_20230311``. Users need to update the flagfile using the updated database::
        
        run_alphafold.sh --flagfile=full_db_20230311.ff --fasta_paths=XX --output_dir=XX ...

.. note::
      Since Version v2.3.0, ``uniclust30_database_path`` has been changed to ``uniref30_database_path``. 

full_db_20230311.ff (for alphafold v3)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Example contents of full_db_20230311.ff for monomer (For ACCESS Anvil, please change ``depot/itap`` to ``anvil``)::

  --db_preset=full_dbs
  --bfd_database_path=/depot/itap/datasets/alphafold/db_20230311/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt
  --data_dir=/depot/itap/datasets/alphafold/db_20230311/
  --uniref90_database_path=/depot/itap/datasets/alphafold/db_20230311/uniref90/uniref90.fasta
  --mgnify_database_path=/depot/itap/datasets/alphafold/db_20230311/mgnify/mgy_clusters_2022_05.fa
  --uniref30_database_path=/depot/itap/datasets/alphafold/db_20230311/uniref30/UniRef30_2021_03
  --pdb70_database_path=/depot/itap/datasets/alphafold/db_20230311/pdb70/pdb70
  --template_mmcif_dir=/depot/itap/datasets/alphafold/db_20230311/pdb_mmcif/mmcif_files
  --obsolete_pdbs_path=/depot/itap/datasets/alphafold/db_20230311/pdb_mmcif/obsolete.dat
  --hhblits_binary_path=/usr/bin/hhblits
  --hhsearch_binary_path=/usr/bin/hhsearch
  --jackhmmer_binary_path=/usr/bin/jackhmmer
  --kalign_binary_path=/usr/bin/kalign

Example contents of full_db_20230311.ff for multimer (For ACCESS Anvil, please change ``depot/itap`` to ``anvil``)::

  --db_preset=full_dbs
  --bfd_database_path=/depot/itap/datasets/alphafold/db_20230311/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt
  --data_dir=/depot/itap/datasets/alphafold/db_20230311/
  --uniref90_database_path=/depot/itap/datasets/alphafold/db_20230311/uniref90/uniref90.fasta
  --mgnify_database_path=/depot/itap/datasets/alphafold/db_20230311/mgnify/mgy_clusters_2022_05.fa
  --uniref30_database_path=/depot/itap/datasets/alphafold/db_20230311/uniref30/UniRef30_2021_03
  --pdb_seqres_database_path=/depot/itap/datasets/alphafold/db_20230311/pdb_seqres/pdb_seqres.txt
  --uniprot_database_path=/depot/itap/datasets/alphafold/db_20230311/uniprot/uniprot.fasta
  --template_mmcif_dir=/depot/itap/datasets/alphafold/db_20230311/pdb_mmcif/mmcif_files
  --obsolete_pdbs_path=/depot/itap/datasets/alphafold/db_20230311/pdb_mmcif/obsolete.dat
  --hhblits_binary_path=/usr/bin/hhblits
  --hhsearch_binary_path=/usr/bin/hhsearch
  --jackhmmer_binary_path=/usr/bin/jackhmmer
  --kalign_binary_path=/usr/bin/kalign

Example job using CPU
~~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

.. note::
   Notice that since version 2.2.0, the parameter ``--use_gpu_relax=False`` is required. 

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
    ml biocontainers alphafold/2.3.1
    
    run_alphafold.sh --flagfile=full_db_20230311.ff  \
        --fasta_paths=sample.fasta --max_template_date=2022-02-01 \
        --output_dir=af2_full_out --model_preset=monomer \
        --use_gpu_relax=False

Example job using GPU
~~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

.. note::
      Notice that since version 2.2.0, the parameter ``--use_gpu_relax=True`` is required. 

To run alphafold using GPU::
    
    #!/bin/bash
    #SBATCH -A myallocation	# Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 11
    #SBATCH --gres=gpu:1
    #SBATCH --job-name=alphafold
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers alphafold/2.3.1
    
    run_alphafold.sh --flagfile=full_db_20230311.ff \
        --fasta_paths=sample.fasta --max_template_date=2022-02-01 \
        --output_dir=af2_full_out --model_preset=monomer \
        --use_gpu_relax=True


.. _Github: https://github.com/deepmind/alphafold/
