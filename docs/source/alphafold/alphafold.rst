.. _backbone-label:

Alphafold
==============================

Introduction
~~~~~~~~
Alphafold is an artificial intelligence program developed by Alphabets's/Google's DeepMind which performs predictions of protein structure.


| For more information, please check:
| Home page: https://github.com/deepmind/alphafold

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.1.1
- 2.2.0
- 2.2.3
- 2.3.0
- 2.3.1

Commands
~~~~~~~
- run_alphafold.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load alphafold

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run alphafold on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=alphafold
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers alphafold

