.. _backbone-label:

Ensembl-vep
==============================

Introduction
~~~~~~~~
Ensembl-vep(Ensembl Variant Effect Predictor) predicts the functional effects of genomic variants.

| For more information, please check:
| Docker hub: https://hub.docker.com/r/ensemblorg/ensembl-vep 
| Home page: https://github.com/Ensembl/ensembl-vep

Versions
~~~~~~~~
- 106.1
- 107.0

Commands
~~~~~~~
- vep
- haplo
- variant_recoder

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ensembl-vep

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ensembl-vep on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ensembl-vep
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ensembl-vep

    haplo -i bos_taurus_UMD3.1.vcf -o out.txt
