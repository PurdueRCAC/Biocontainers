.. _backbone-label:

Krakentools
==============================

Introduction
~~~~~~~~
Krakentools is a suite of scripts to be used for post-analysis of Kraken/KrakenUniq/Kraken2/Bracken results.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/krakentools 
| Home page: https://github.com/jenniferlu717/KrakenTools

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.2

Commands
~~~~~~~
- alpha_diversity.py
- beta_diversity.py
- combine_kreports.py
- combine_mpa.py
- extract_kraken_reads.py
- filter_bracken.out.py
- fix_unmapped.py
- kreport2krona.py
- kreport2mpa.py
- make_kreport.py
- make_ktaxonomy.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load krakentools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run krakentools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=krakentools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers krakentools

