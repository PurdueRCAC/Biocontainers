.. _backbone-label:

Aspera-connect
==============================

Introduction
~~~~~~~~
Aspera Connect is software that allows download and upload data. The software includes a command line tool (ascp) that allows scripted data transfer.


| For more information, please check:
|

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 4.2.6

Commands
~~~~~~~
- ascp
- ascp4
- asperaconnect
- asperaconnect.bin
- asperaconnect-nmh
- asperacrypt
- asunprotect

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load aspera-connect

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run aspera-connect on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=aspera-connect
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers aspera-connect

