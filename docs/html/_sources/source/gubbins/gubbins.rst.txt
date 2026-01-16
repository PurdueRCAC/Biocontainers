.. _backbone-label:

Gubbins
==============================

Introduction
~~~~~~~~
Gubbins is an algorithm that iteratively identifies loci containing elevated densities of base substitutions while concurrently constructing a phylogeny based on the putative point mutations outside of these regions.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gubbins 
| Home page: https://github.com/nickjcroucher/gubbins

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

  * - ANVIL
    - 3.2.0, 3.3
  * - BELL
    - 3.2.0, 3.3
  * - GAUTSCHI
    - 3.2.0, 3.3
  * - NEGISHI
    - 3.2.0, 3.3
  * - SCHOLAR
    - 3.2.0, 3.3

Commands
~~~~~~~
- extract_gubbins_clade.py
- generate_ska_alignment.py
- gubbins_alignment_checker.py
- mask_gubbins_aln.py
- run_gubbins.py
- sumlabels.py
- sumtrees.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gubbins

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gubbins on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gubbins
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gubbins
