.. _backbone-label:

Arboreto
==============================

Introduction
~~~~~~~~
Arboreto is a package for scalable gene regulatory network inference using tree-based ensemble regressors.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/arboreto 
| Home page: https://github.com/tmoerman/arboreto

Versions
~~~~~~~~
- 0.1.6-py

Commands
~~~~~~~
- easy_install
- f2py
- f2py3
- idle3
- pip
- pip3
- pydoc
- pydoc3
- python
- python3
- python3-config
- python3.9
- python3.9-config
- wheel

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load arboreto

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run arboreto on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=arboreto
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers arboreto
