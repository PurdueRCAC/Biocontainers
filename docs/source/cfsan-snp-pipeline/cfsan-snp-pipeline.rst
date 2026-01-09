.. _backbone-label:

Cfsan-snp-pipeline
==============================

Introduction
~~~~~~~~
The CFSAN SNP Pipeline is a Python-based system for the production of SNP matrices from sequence data used in the phylogenetic analysis of pathogenic organisms sequenced from samples of interest to food safety.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/cfsan-snp-pipeline 
| Home page: https://github.com/CFSAN-Biostatistics/snp-pipeline

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.2.1

Commands
~~~~~~~
- cfsan_snp_pipeline

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cfsan-snp-pipeline

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cfsan-snp-pipeline on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cfsan-snp-pipeline
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cfsan-snp-pipeline

