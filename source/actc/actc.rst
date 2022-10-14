.. _backbone-label:

Actc
==============================

Introduction
~~~~~~~~
Actc is used to align subreads to ccs reads.

| For more information, please check:
| Home page: https://github.com/PacificBiosciences/actc

Versions
~~~~~~~~
- 0.2.0

Commands
~~~~~~~
- actc

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load actc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run actc on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=actc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers actc

    actc subreads.bam ccs.bam subreads_to_ccs.bam
