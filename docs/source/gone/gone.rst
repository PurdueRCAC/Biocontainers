.. _backbone-label:

Gone
==============================

Introduction
~~~~~~~~
Scripts and programs referred to in the paper "Recent demographic history inferred by high-resolution analysis of linkage disequilibrium" by Enrique Santiago, Irene Novo, Antonio F. Pardiñas, María Saura, Jinliang Wang and Armando Caballero. Molecular Biology and Evolution, 2020 Volume 37, Issue 12, Pages 3642–3653, https://doi.org/10.1093/molbev/msaa169


| For more information, please check:
| BioContainers: 
| Home page: https://github.com/esrud/GONE

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 01.07.2020

Commands
~~~~~~~
- GONE
- GONEaverage
- LD_SNP_REAL3
- SUMM_REP_CHROM3
- MANAGE_CHROMOSOMES2
- script_GONE.sh
- GONEparallel.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gone

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gone on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gone
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gone
