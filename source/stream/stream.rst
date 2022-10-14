.. _backbone-label:

STREAM
==============================

Introduction
~~~~~~~~
``STREAM`` (Single-cell Trajectories Reconstruction, Exploration And Mapping) is an interactive pipeline capable of disentangling and visualizing complex branching trajectories from both single-cell transcriptomic and epigenomic data. 
| For more information, please check its | Docker hub: https://hub.docker.com/r/pinellolab/stream and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load stream

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run STREAM on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=stream
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers stream

.. _Github: https://github.com/pinellolab/STREAM
