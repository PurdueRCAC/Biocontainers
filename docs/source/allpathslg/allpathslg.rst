.. _backbone-label:

Allpathslg
==============================

Introduction
~~~~~~~~
``Allpathslg`` is a whole-genome shotgun assembler that can generate high-quality genome assemblies using short reads. 

| For more information, please check its website: https://biocontainers.pro/tools/allpathslg and its home page: https://software.broadinstitute.org/allpaths-lg/blog/.

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

To run Allpathslg on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=allpathslg
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers allpathslg
    
    PrepareAllPathsInputs.pl \
                           DATA_DIR=data \
                           PLOIDY=1 \
                           IN_GROUPS_CSV=in_groups.csv\
                           IN_LIBS_CSV=in_libs.csv\
                           OVERWRITE=True\

    RunAllPathsLG PRE=allpathlg REFERENCE_NAME=test.genome \
                  DATA_SUBDIR=data  RUN=myrun TARGETS=standard \
                  SUBDIR=test OVERWRITE=True
~                      
