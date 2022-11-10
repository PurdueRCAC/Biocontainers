.. _backbone-label:

Momi
==============================

Introduction
~~~~~~~~
momi (MOran Models for Inference) is a Python package that computes the expected sample frequency spectrum (SFS), a statistic commonly used in population genetics, and uses it to fit demographic history.


| For more information, please check:
| Home page: https://momi2.readthedocs.io/en/latest/

Versions
~~~~~~~~
- 2.1.19

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load momi

Interactive job
~~~~
To run momi interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers momi
   (base) UserID@bell-a008:~ $ python
   Python 3.9.7 (default, Sep 16 2021, 13:09:58) 
   [GCC 7.5.0] :: Anaconda, Inc. on linux
   Type "help", "copyright", "credits" or "license" for more information.  
   >>> import momi
   >>> import logging
   >>> logging.basicConfig(level=logging.INFO,
                    filename="tutorial.log")
   >>> model = momi.DemographicModel(N_e=1.2e4, gen_time=29,
                              muts_per_gen=1.25e-8)


Batch job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run momi on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=momi
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers momi

    python python.py
