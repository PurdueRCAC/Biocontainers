.. _backbone-label:

Crispresso2
==============================

Introduction
~~~~~~~~
CRISPResso2 is a software pipeline designed to enable rapid and intuitive interpretation of genome editing experiments.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/pinellolab/crispresso2 
| Home page: https://github.com/pinellolab/CRISPResso2

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.2.10
- 2.2.11a
- 2.2.8
- 2.2.9

Commands
~~~~~~~
- CRISPResso
- CRISPRessoAggregate
- CRISPRessoBatch
- CRISPRessoCompare
- CRISPRessoPooled
- CRISPRessoPooledWGSCompare
- CRISPRessoWGS

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load crispresso2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run crispresso2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=crispresso2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers crispresso2

