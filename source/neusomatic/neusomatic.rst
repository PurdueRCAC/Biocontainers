.. _backbone-label:

Neusomatic
==============================

Introduction
~~~~~~~~
NeuSomatic is based on deep convolutional neural networks for accurate somatic mutation detection. With properly trained models, it can robustly perform across sequencing platforms, strategies, and conditions. NeuSomatic summarizes and augments sequence alignments in a novel way and incorporates multi-dimensional features to capture variant signals effectively. It is not only a universal but also accurate somatic mutation detection method.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/msahraeian/neusomatic/ 
| Home page: https://github.com/bioinform/neusomatic

Versions
~~~~~~~~
- 0.2.1

Commands
~~~~~~~
- call.py
- dataloader.py
- extract_postprocess_targets.py
- filter_candidates.py
- generate_dataset.py
- long_read_indelrealign.py
- merge_post_vcfs.py
- merge_tsvs.py
- network.py
- postprocess.py
- preprocess.py
- resolve_scores.py
- resolve_variants.py
- scan_alignments.py
- split_bed.py
- train.py
- utils.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load neusomatic

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run neusomatic on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=neusomatic
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers neusomatic
