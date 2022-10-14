.. _backbone-label:

Hail
==============================

Introduction
~~~~~~~~
Hail is an open-source, general-purpose, Python-based data analysis tool with additional data types and methods for working with genomic data.
|For more information, please check:
|Docker hub: https://hub.docker.com/r/hailgenetics/hail 
|Home page: https://github.com/hail-is/hail

Versions
~~~~~~~~
- 0.2.94
- 0.2.98

Commands
~~~~~~~
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load hail

Interactive job
~~~~~~
To run Hail interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers hail
   (base) UserID@bell-a008:~ $ python3
   Python 3.7.13 (default, Apr 24 2022, 01:05:22)  
   [GCC 9.4.0] on linux
   Type "help", "copyright", "credits" or "license" for more information.  
   >>> import hail as hl
   >>>  print(hl.citation())
   Hail Team. Hail 0.2.94-f0b38d6c436f. https://github.com/hail-is/hail/commit/f0b38d6c436f.

Batch job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run hail on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=hail
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers hail
    python3 script.py
