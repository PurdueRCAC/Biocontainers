.. _backbone-label:

Treetime
==============================

Introduction
~~~~~~~~
``Treetime`` is a tool for maximum likelihood dating and ancestral sequence inference. 
| For more information, please check its website: https://biocontainers.pro/tools/treetime and its home page on `Github`_.

Versions
~~~~~~~~
- 0.8.6
- 0.9.4

Commands
~~~~~~~
- treetime

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load treetime

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Treetime on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=treetime
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers treetime

    treetime ancestral --aln input.fasta --tree input.nwk
.. _Github: https://github.com/neherlab/treetime
