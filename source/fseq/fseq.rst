.. _backbone-label:

Fseq
==============================

Introduction
~~~~~~~~
``Fseq`` is a feature density estimator for high-throughput sequence tags. 

| For more information, please check its home page: https://fureylab.web.unc.edu/software/fseq/.

Versions
~~~~~~~~
- 2.0.3

Commands
~~~~~~~
- fseq2

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load fseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Fseq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fseq
