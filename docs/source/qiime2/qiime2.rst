.. _backbone-label:

Qiime2
==============================

Introduction
~~~~~~~~
QIIME 2 is a powerful, extensible, and decentralized microbiome analysis package with a focus on data and analysis transparency. QIIME 2 enables researchers to start an analysis with raw DNA sequence data and finish with publication-quality figures and statistical results.


| For more information, please check:
| BioContainers: https://quay.io/repository/qiime2/core 
| Home page: https://qiime2.org/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2021.2
- 2022.11
- 2022.2
- 2022.8
- 2023.2
- 2023.5
- 2023.7

Commands
~~~~~~~
- biom
- qiime
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load qiime2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run qiime2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=qiime2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers qiime2

