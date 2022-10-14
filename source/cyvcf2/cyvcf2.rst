.. _backbone-label:

Cyvcf2
==============================

Introduction
~~~~~~~~
``Cyvcf2`` is a cython wrapper around htslib built for fast parsing of Variant Call Format (VCF) files. 

| For more information, please check its website: https://biocontainers.pro/tools/cyvcf2 and its home page on `Github`_.

Versions
~~~~~~~~
- 0.30.14-py37

Commands
~~~~~~~
- cyvcf2
- python
- python3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load cyvcf2

Interactive job
~~~~~
To run Cyvcf2 interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n1 -t1:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers scanpy/1.8.2
   (base) UserID@bell-a008:~ $ python
   Python 3.7.12 |  packaged by conda-forge |  (default, Oct 26 2021, 06:08:53) 
   [GCC 9.4.0] on linux
   Type "help", "copyright", "credits" or "license" for more information.
   >>> from cyvcf2 import VCF


Batch job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Cyvcf2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cyvcf2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cyvcf2

    cyvcf2 --help 
    cyvcf2 [OPTIONS] <vcf_file>

    
.. _Github: https://github.com/brentp/cyvcf2
