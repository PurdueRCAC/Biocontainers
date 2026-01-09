.. _backbone-label:

Deepvariant
==============================

Introduction
~~~~~~~~
DeepVariant is a deep learning-based variant caller that takes aligned reads (in BAM or CRAM format), produces pileup image tensors from them, classifies each tensor using a convolutional neural network, and finally reports the results in a standard VCF or gVCF file.


| For more information, please check:
| Home page: https://github.com/google/deepvariant

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.0.0
- 1.1.0

Commands
~~~~~~~
- call_variants
- get-pip.py
- make_examples
- model_eval
- model_train
- postprocess_variants
- run-prereq.sh
- run_deepvariant
- run_deepvariant.py
- settings.sh
- show_examples
- vcf_stats_report

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load deepvariant

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run deepvariant on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=deepvariant
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers deepvariant

