.. _backbone-label:

Augur
==============================

Introduction
~~~~~~~~
Augur is the bioinformatics toolkit we use to track evolution from sequence and serological data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/augur 
| Home page: https://github.com/nextstrain/augur

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 14.0.0
- 15.0.0

Commands
~~~~~~~
- augur

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load augur

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run augur on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=augur
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers augur

