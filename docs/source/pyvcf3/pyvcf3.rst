.. _backbone-label:

Pyvcf3
==============================

Introduction
~~~~~~~~
PyVCF3 has been created because the Official PyVCF repository is no longer maintained and do not accept any pull requests.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/pyvcf3 
| Home page: https://github.com/dridk/PyVCF3

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.0.3

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pyvcf3

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pyvcf3 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pyvcf3
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pyvcf3

