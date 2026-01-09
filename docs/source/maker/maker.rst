.. _backbone-label:

MAKER
==============================

Introduction
~~~~~~~
``MAKER`` is a popular genome annotation pipeline for both prokaryotic and eukaryotic genomes. This guide describes best practices for running MAKER on RCAC clusters. For detailed information about MAKER, see its offical website (http://weatherby.genetics.utah.edu/MAKER/wiki/index.php/MAKER_Tutorial_for_WGS_Assembly_and_Annotation_Winter_School_2018).

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.31.11, 3.01.03
  * - BELL
    - 2.31.11, 3.01.03
  * - GAUTSCHI
    - 2.31.11, 3.01.03
  * - NEGISHI
    - 2.31.11, 3.01.03
  * - SCHOLAR
    - 2.31.11, 3.01.03

Commands
~~~~~~
- cegma2zff
- chado2gff3
- compare
- cufflinks2gff3
- evaluator
- fasta_merge
- fasta_tool
- genemark_gtf2gff3
- gff3_merge
- iprscan2gff3
- iprscan_wrap
- ipr_update_gff
- maker
- maker2chado
- maker2eval_gtf
- maker2jbrowse
- maker2wap
- maker2zff
- maker_functional
- maker_functional_fasta
- maker_functional_gff
- maker_map_ids
- map2assembly
- map_data_ids
- map_fasta_ids
- map_gff_ids
- tophat2gff3

Module
~~~~~~~
You can load the modules by::

  module load biocontainers
  module load maker/2.31.11 # OR maker/3.01.03  

.. note::
  ``Dfam release 3.5`` (October 2021) downloaded from Dfam website (https://www.dfam.org/home) that required by ``RepeatMasker`` has been set up for users. The ``RepeatMakser`` library is stored here ``/depot/itap/datasets/Maker/RepeatMasker/Libraries``. 

Prerequisites
~~~~~~
1. After loading MAKER modules, users can create MAKER control files by the folowing comand::

    maker -CTL
    
   This will generate three files:

- **maker_opts.ctl** (required to be modified)
- **maker_exe.ctl** (do not need to modify this file)
- **maker_bopts.ctl** (optionally modify this file) 

2. maker_opts.ctl:
   - If not using RepeatMasker, modify ``model_org=all`` to ``model_org=``
   - If not using RepeatMasker, modify ``model_org=all`` to an appropriate family/genus/species.  
 
Example job non-mpi
~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run MAKER on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=MAKER
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers maker/2.31.11  # or maker/3.01.03 
    
    maker -c 24

Example job mpi
~~~~~~
To use MAKER in MPI mode, we cannot use the maker modules. Instead we have to use the singularity image files stored in ``/apps/biocontainers/images``::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 5:00:00
    #SBATCH -N 2
    #SBATCH -n 24
    #SBATCH -c 8
    #SBATCH --job-name=MAKER_mpi
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --mail-user=UserID@purdue.edu
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out
     
    ## MAKER2
    mpirun -n 24 singularity exec /apps/biocontainers/images/maker_2.31.11.sif maker -c 8
    
    ## MAKER3
    mpirun -n 24 singularity exec /apps/biocontainers/images/maker_3.01.03.sif maker -c 8
