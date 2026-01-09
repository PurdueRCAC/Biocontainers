.. _backbone-label:

Interproscan
==============================

Introduction
~~~~~~~~
Interproscan is the software package that allows sequences to be scanned against InterPro's member database signatures.


| For more information, please check:
| Home page: https://github.com/ebi-pf-team/interproscan

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 5.54_87.0
- 5.61-93.0

Commands
~~~~~~~
- interproscan.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load interproscan

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run interproscan on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=interproscan
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers interproscan

