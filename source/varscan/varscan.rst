.. _backbone-label:

Varscan
==============================

Introduction
~~~~~~~~
``Varscan`` is a tool used for variant detection in massively parallel sequencing data. |For more information, please check its home page: http://varscan.sourceforge.net/index.html.

Versions
~~~~~~~~
- 2.4.2
- 2.4.4

Commands
~~~~~~~
- VarScan.v2.4.4.jar

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load varscan

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Varscan on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=varscan
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers varscan
