.. _backbone-label:

Modeltest-ng
==============================

Introduction
~~~~~~~~
ModelTest-NG is a tool for selecting the best-fit model of evolution for DNA and protein alignments. ModelTest-NG supersedes jModelTest and ProtTest in one single tool, with graphical and command console interfaces.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/modeltest-ng 
| Home page: https://github.com/ddarriba/modeltest

Versions
~~~~~~~~
- 0.1.7

Commands
~~~~~~~
- modeltest-ng
- modeltest-ng-mpi

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load modeltest-ng

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run modeltest-ng on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=modeltest-ng
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers modeltest-ng
