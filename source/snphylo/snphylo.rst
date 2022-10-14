.. _backbone-label:

Snphylo
==============================

Introduction
~~~~~~~~
Snphylo is a pipeline to generate a phylogenetic tree from huge SNP data.

| For more information, please check:
| Docker hub: https://hub.docker.com/r/finchnsnps/snphylo 
| Home page: https://github.com/thlee/SNPhylo

Versions
~~~~~~~~
- 20180901

Commands
~~~~~~~
- Rscript
- snphylo.sh
- convert_fasta_to_phylip.py
- convert_simple_to_hapmap.py
- determine_bs_tree.R
- draw_unrooted_tree.R
- generate_snp_sequence.R
- remove_low_depth_genotype_data.py
- remove_no_genotype_data.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load snphylo

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run snphylo on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=snphylo
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers snphylo
