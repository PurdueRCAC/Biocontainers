.. _backbone-label:

Pymol
==============================

Introduction
~~~~~~~~
PyMOL is a user-sponsored molecular visualization system on an open-source foundation, maintained and distributed by Schrödinger. This module contains the open-source version of PYMOL.


| For more information, please check:
| Home page: https://pymol.org/2/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.5.0

Commands
~~~~~~~
- pymol

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pymol

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pymol on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pymol
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pymol

