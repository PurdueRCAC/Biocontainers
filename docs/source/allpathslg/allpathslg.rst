.. _backbone-label:

Allpathslg
==============================

Introduction
~~~~~~~~
Allpathslg is a whole-genome shotgun assembler that can generate high-quality genome assemblies using short reads.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/allpathslg 
| Home page: https://software.broadinstitute.org/allpaths-lg/blog/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 52488

Commands
~~~~~~~
- PrepareAllPathsInputs.pl
- RunAllPathsLG
- CacheLibs.pl
- Fasta2Fastb

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load allpathslg

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run allpathslg on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=allpathslg
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers allpathslg

