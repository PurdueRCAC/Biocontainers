.. _backbone-label:

Pygenomeviz
==============================

Introduction
~~~~~~~~
pyGenomeViz is a genome visualization python package for comparative genomics implemented based on matplotlib.

| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/pygenomeviz 
| Home page: https://github.com/moshi4/pyGenomeViz#cli-examples

Versions
~~~~~~~~
- 0.2.2

Commands
~~~~~~~
- pgv-download-dataset
- pgv-mmseqs
- pgv-mummer
- pgv-pmauve
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pygenomeviz

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pygenomeviz on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pygenomeviz
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pygenomeviz
