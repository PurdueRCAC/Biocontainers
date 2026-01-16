.. _backbone-label:

Mikado
==============================

Introduction
~~~~~~~~
Mikado is a lightweight Python3 pipeline to identify the most useful or “best” set of transcripts from multiple transcript assemblies.


| For more information, please check:
| BioContainers: 
| Home page: http://mikado.readthedocs.org/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - BELL
    - v2.3.5rc2
  * - NEGISHI
    - v2.3.5rc2

Commands
~~~~~~~
- mikado

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load mikado

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run mikado on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mikado
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mikado
