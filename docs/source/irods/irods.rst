.. _backbone-label:

Irods
==============================

Introduction
~~~~~~~~
iCommands is a collection of commands used to interact with an iRODS server


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/irods-icommands 
| Home page: https://irods.org/

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 4.0.3

Commands
~~~~~~~
- iadmin
- ibun
- icd
- ichksum
- ichmod
- icp
- ienv
- ierror
- iexecmd
- iexit
- ifsck
- iget
- igroupadmin
- ihelp
- iinit
- ils
- ilsresc
- imcoll
- imeta
- imiscsvrinfo
- imkdir
- imv
- ipasswd
- iphybun
- iphymv
- ips
- iput
- ipwd
- iqdel
- iqmod
- iqstat
- iquest
- iquota
- ireg
- irepl
- irm
- irmdir
- irmtrash
- irsync
- irule
- iscan
- isysmeta
- iticket
- itrim
- iuserinfo
- ixmsg
- izonereport

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load irods

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run irods on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=irods
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers irods
