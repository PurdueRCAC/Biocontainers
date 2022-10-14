.. _backbone-label:

Gemoma
==============================

Introduction
~~~~~~~~
Gene Model Mapper (GeMoMa) is a homology-based gene prediction program. GeMoMa uses the annotation of protein-coding genes in a reference genome to infer the annotation of protein-coding genes in a target genome. Thereby, GeMoMa utilizes amino acid sequence and intron position conservation. In addition, GeMoMa allows to incorporate RNA-seq evidence for splice site prediction.
For more information, please check:
BioContainers: https://biocontainers.pro/tools/gemoma 
Home page: http://www.jstacs.de/index.php/GeMoMa

Versions
~~~~~~~~
- 1.7.1

Commands
~~~~~~~
- GeMoMa

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gemoma

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gemoma on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gemoma
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gemoma
