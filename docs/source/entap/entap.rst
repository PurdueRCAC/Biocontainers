.. _backbone-label:

Entap
==============================

Introduction
~~~~~~~~
The Eukaryotic Non-Model Transcriptome Annotation Pipeline (EnTAP) is designed to improve the accuracy, speed, and flexibility of functional gene annotation for de novo assembled transcriptomes in non-model eukaryotes.


| For more information, please check:
| BioContainers: https://hub.docker.com/r/plantgenomics/entap/tags 
| Home page: https://entap.readthedocs.io/en/latest/index.html

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - BELL
    - 2.0.0, 2.2.0
  * - NEGISHI
    - 2.0.0, 2.2.0

Commands
~~~~~~~
- EnTAP

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load entap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run entap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=entap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers entap
