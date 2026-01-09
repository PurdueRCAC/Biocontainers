.. _backbone-label:

Phred
==============================

Introduction
~~~~~~~~
The phred software reads DNA sequencing trace files, calls bases, and assigns a quality value to each called base.


| For more information, please check:
| Home page: http://www.phrap.org/phredphrapconsed.html#block_phred

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.071220.c

Commands
~~~~~~~
- phred

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load phred

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run phred on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=phred
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers phred

