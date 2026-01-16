.. _backbone-label:

Vadr
==============================

Introduction
~~~~~~~~
VADR is a suite of tools for classifying and analyzing sequences homologous to a set of reference models of viral genomes or gene families. It has been mainly tested for analysis of Norovirus, Dengue, and SARS-CoV-2 virus sequences in preparation for submission to the GenBank database.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/vadr 
| Home page: https://github.com/ncbi/vadr

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
    - 1.4.1, 1.4.2, 1.5
  * - BELL
    - 1.4.1, 1.4.2, 1.5
  * - GAUTSCHI
    - 1.4.1, 1.4.2, 1.5
  * - NEGISHI
    - 1.4.1, 1.4.2, 1.5
  * - SCHOLAR
    - 1.4.1, 1.4.2, 1.5

Commands
~~~~~~~
- parse_blast.pl
- v-annotate.pl
- v-build.pl
- v-test.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load vadr

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run vadr on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=vadr
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers vadr
