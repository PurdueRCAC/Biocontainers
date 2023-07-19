.. _backbone-label:

Ftp
==============================

Introduction
~~~~~~~~
A File Transfer Protocol client (FTP client) is a software utility that establishes a connection between a host computer and a remote server, typically an FTP server.


| For more information, please check:
|

Versions
~~~~~~~~
- 0.17

Commands
~~~~~~~
- ftp

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ftp

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ftp on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ftp
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ftp
