.. _backbone-label:

Das_tool
==============================

Introduction
~~~~~~~~
DAS Tool is an automated method that integrates the results of a flexible number of binning algorithms to calculate an optimized, non-redundant set of bins from a single assembly.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/das_tool 
| Home page: https://github.com/cmks/DAS_Tool

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.1.6
  * - BELL
    - 1.1.6
  * - GAUTSCHI
    - 1.1.6
  * - NEGISHI
    - 1.1.6
  * - SCHOLAR
    - 1.1.6

Commands
~~~~~~~
- DAS_Tool
- Contigs2Bin_to_Fasta.sh
- Fasta_to_Contig2Bin.sh
- get_species_taxids.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load das_tool

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run das_tool on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=das_tool
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers das_tool

    DAS_Tool -i sample.human.gut_concoct_contigs2bin.tsv,\
        sample.human.gut_maxbin2_contigs2bin.tsv,\
        sample.human.gut_metabat_contigs2bin.tsv,\
        sample.human.gut_tetraESOM_contigs2bin.tsv \
        -l concoct,maxbin,metabat,tetraESOM \
        -c sample.human.gut_contigs.fa \
        -o DASToolRun2 \
        --proteins DASToolRun1_proteins.faa \
        --write_bin_evals \
        --threads 4 \
        --score_threshold 0.6
