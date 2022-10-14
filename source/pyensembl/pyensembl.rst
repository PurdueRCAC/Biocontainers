.. _backbone-label:

Pyensembl
==============================

Introduction
~~~~~~~~
``Pyensembl`` is a Python interface to Ensembl reference genome metadata such as exons and transcripts. | For more information, please check its website: https://biocontainers.pro/tools/pyensembl and its home page on `Github`_.

Versions
~~~~~~~~
- 1.9.4

Commands
~~~~~~~
- pyensembl
- python
- python3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load pyensembl

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Pyensembl on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pyensembl
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pyensembl

.. _Github: https://github.com/openvax/pyensembl
