.. _backbone-label:

Pepper_deepvariant
==============================

Introduction
~~~~~~~~
PEPPER is a genome inference module based on recurrent neural networks that enables long-read variant calling and nanopore assembly polishing in the PEPPER-Margin-DeepVariant pipeline. This pipeline enables nanopore-based variant calling with DeepVariant.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/kishwars/pepper_deepvariant 
| Home page: https://github.com/kishwarshafin/pepper

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- r0.4.1

Commands
~~~~~~~
- run_pepper_margin_deepvariant

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pepper_deepvariant

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pepper_deepvariant on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pepper_deepvariant
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pepper_deepvariant

