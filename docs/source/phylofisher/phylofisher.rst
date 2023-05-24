.. _backbone-label:

Phylofisher
==============================

Introduction
~~~~~~~~
PhyloFisher is a software package written in Python3 that can be used for the creation, analysis, and visualization of phylogenomic datasets that consist of eukaryotic protein sequences.


| For more information, please check:
| Home page: https://github.com/TheBrownLab/PhyloFisher

Versions
~~~~~~~~
- 1.2.7

Commands
~~~~~~~
- aa_comp_calculator.py
- aa_recoder.py
- apply_to_db.py
- astral_runner.py
- backup_restoration.py
- bipartition_examiner.py
- build_database.py
- config.py
- edirect.py
- explore_database.py
- fast_site_remover.py
- fast_taxa_remover.py
- fisher.py
- forest.py
- genetic_code_examiner.py
- gfmix_runner.py
- heterotachy.py
- informant.py
- install_deps.py
- jp.py
- mammal_modeler.py
- matrix_constructor.py
- prep_final_dataset.py
- purge.py
- random_resampler.py
- rst2html.py
- rst2html4.py
- rst2html5.py
- rst2latex.py
- rst2man.py
- rst2odt.py
- rst2odt_prepstyles.py
- rst2pseudoxml.py
- rst2s5.py
- rst2xetex.py
- rst2xml.py
- rstpep2html.py
- rtc_binner.py
- runxlrd.py
- select_orthologs.py
- select_taxa.py
- sgt_constructor.py
- taxon_collapser.py
- vba_extract.py
- windowmasker_2.2.22_adapter.py
- working_dataset_constructor.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load phylofisher

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run phylofisher on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=phylofisher
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers phylofisher
