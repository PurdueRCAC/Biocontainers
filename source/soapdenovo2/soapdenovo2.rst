.. _backbone-label:

Soapdenovo2
==============================

Introduction
~~~~~~~~
``Soapdenovo2`` is a short-read assembly method to build de novo draft assembly. | For more information, please check its website: https://biocontainers.pro/tools/soapdenovo2 and its home page: http://soap.genomics.org.cn/soapdenovo.html.

Versions
~~~~~~~~
- 2.40

Commands
~~~~~~~
- SOAPdenovo-127mer
- SOAPdenovo-63mer

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load soapdenovo2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Soapdenovo2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=soapdenovo2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers soapdenovo2

    SOAPdenovo-127mer all -s config_file -K 63 -R -o graph_prefix 1>ass.log 2>ass.err
