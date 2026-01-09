.. _backbone-label:

Tiara
==============================

Introduction
~~~~~~~~
Tiara is a deep-learning-based approach for identification of eukaryotic sequences in the metagenomic data powered by PyTorch.


| For more information, please check:
| Dockerhub: https://hub.docker.com/r/zhan4429/tiara 
| Home page: https://github.com/ibe-uw/tiara

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.0.2

Commands
~~~~~~~
- tiara

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load tiara

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run tiara on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=tiara
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers tiara

