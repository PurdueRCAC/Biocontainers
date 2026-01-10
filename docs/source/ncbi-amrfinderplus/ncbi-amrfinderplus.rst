.. _backbone-label:

Ncbi-amrfinderplus
==============================

Introduction
~~~~~~~~
Ncbi-amrfinderplus and the accompanying database identify acquired antimicrobial resistance genes in bacterial protein and/or assembled nucleotide sequences as well as known resistance-associated point mutations for several taxa.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/ncbi-amrfinderplus 
| Home page: https://github.com/ncbi/amr

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
    - 3.10.30, 3.10.42, 3.11.2
  * - BELL
    - 3.10.30, 3.10.42, 3.11.2
  * - GAUTSCHI
    - 3.10.30, 3.10.42, 3.11.2
  * - NEGISHI
    - 3.10.30, 3.10.42, 3.11.2
  * - SCHOLAR
    - 3.10.30, 3.10.42, 3.11.2

Commands
~~~~~~~
- amrfinder
- amr_report
- amrfinder_update

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ncbi-amrfinderplus

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ncbi-amrfinderplus on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ncbi-amrfinderplus
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ncbi-amrfinderplus
