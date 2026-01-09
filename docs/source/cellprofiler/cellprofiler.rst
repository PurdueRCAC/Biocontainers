.. _backbone-label:

Cellprofiler
==============================

Introduction
~~~~~~~~
CellProfiler is a free open-source software designed to enable biologists without training in computer vision or programming to quantitatively measure phenotypes from thousands of images automatically.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/cellprofiler 
| Home page: https://cellprofiler.org/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 4.2.8

Commands
~~~~~~~
- cellprofiler

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cellprofiler

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cellprofiler on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cellprofiler
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cellprofiler

