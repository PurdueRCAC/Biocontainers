.. _backbone-label:

Usefulaf
==============================

Introduction
~~~~~~~~
Usefulaf is an all-in-one Docker/Singularity image for single-cell processing with Alevin-fry(paper). It includes the all tools you need to turn your FASTQ files into a count matrix and then load it into your favorite analysis environment.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/combinelab/usefulaf 
| Home page: https://github.com/COMBINE-lab/usefulaf

Versions
~~~~~~~~
- 0.9.2

Commands
~~~~~~~
- simpleaf
- R
- Rscript
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load usefulaf

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run usefulaf on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=usefulaf
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers usefulaf
