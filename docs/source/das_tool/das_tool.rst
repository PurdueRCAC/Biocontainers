.. _backbone-label:

Das_tool
==============================

Introduction
~~~~~~~~
DAS Tool is an automated method that integrates the results of a flexible number of binning algorithms to calculate an optimized, non-redundant set of bins from a single assembly.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/das_tool 
| Home page: https://github.com/cmks/DAS_Tool

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
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
    #SBATCH -n 1
    #SBATCH --job-name=das_tool
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers das_tool

