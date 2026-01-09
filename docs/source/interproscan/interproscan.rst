.. _backbone-label:  
InterProScan
============================== 

Introduction
~~~~~~~
``InterPro`` is a database which integrates together predictive information about proteins’ function from a number of partner resources, giving an overview of the families that a protein belongs to and the domains and sites it contains.

Users who have novel nucleotide or protein sequences that they wish to functionally characterise can use the software package ``InterProScan`` to run the scanning algorithms from the InterPro database in an integrated way. Sequences are submitted in FASTA format. Matches are then calculated against all of the required member database’s signatures and the results are then output in a variety of formats. 

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 5.54_87.0, 5.61-93.0
  * - BELL
    - 5.54_87.0, 5.61-93.0
  * - GAUTSCHI
    - 5.54_87.0, 5.61-93.0
  * - NEGISHI
    - 5.54_87.0, 5.61-93.0
  * - SCHOLAR
    - 5.54_87.0, 5.61-93.0

Commands
~~~~~~
interproscan.sh

Database
~~~~~~
Latest version of database has been downloaded and setup in **/depot/itap/datasets/interproscan-5.54-87.0/data**. 

Module
~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load interproscan/5.54_87.0

Example job
~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run run_dbcan on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=interproscan
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers interproscan/5.54_87.0
    
    interproscan.sh -cpu 24 -i test_proteins.fasta
    interproscan.sh -cpu 24 -t n -i test_nt_seqs.fasta
    

.. _Github: https://github.com/linnabrown/run_dbcan
