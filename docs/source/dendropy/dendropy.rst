.. _backbone-label:

Dendropy
==============================

Introduction
~~~~~~~~
DendroPy is a Python library for phylogenetic computing. It provides classes and functions for the simulation, processing, and manipulation of phylogenetic trees and character matrices, and supports the reading and writing of phylogenetic data in a range of formats, such as NEXUS, NEWICK, NeXML, Phylip, FASTA, etc. Application scripts for performing some useful phylogenetic operations, such as data conversion and tree posterior distribution summarization, are also distributed and installed as part of the libary. DendroPy can thus function as a stand-alone library for phylogenetics, a component of more complex multi-library phyloinformatic pipelines, or as a scripting "glue" that assembles and drives such pipelines.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/dendropy 
| Home page: https://github.com/jeetsukumaran/DendroPy

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 4.5.2

Commands
~~~~~~~
- python
- python3
- 
- 
- sumtrees.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load dendropy

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run dendropy on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=dendropy
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers dendropy

