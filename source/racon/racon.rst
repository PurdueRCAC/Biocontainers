.. _backbone-label:

Racon
==============================

Introduction
~~~~~~~~
``Racon`` is a consensus module for raw de novo DNA assembly of long uncorrected reads. | For more information, please check its website: https://biocontainers.pro/tools/racon and its home page on `Github`_.

Versions
~~~~~~~~
- 1.4.20
- 1.5.0

Commands
~~~~~~~
- racon

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load racon

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Racon on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=racon
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers racon

.. _Github: https://github.com/lbcb-sci/racon
