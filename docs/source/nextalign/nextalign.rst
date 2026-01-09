.. _backbone-label:

Nextalign
==============================

Introduction
~~~~~~~~
Nextalign is a viral genome sequence alignment tool for command line.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/nextstrain/nextalign 
| Home page: https://docs.nextstrain.org/projects/nextclade/en/stable/user/nextalign-cli.html

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.10.3

Commands
~~~~~~~
- nextalign

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load nextalign

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run nextalign on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=nextalign
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers nextalign

