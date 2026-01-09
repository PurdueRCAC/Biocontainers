.. _backbone-label:

Sage
==============================

Introduction
~~~~~~~~
Sage is a proteomics search engine - a tool that transforms raw mass spectra from proteomics experiments into peptide identificatons via database searching & spectral matching. But, it's also more than just a search engine - Sage includes a variety of advanced features that make it a one-stop shop: retention time prediction, quantification (both isobaric & LFQ), peptide-spectrum match rescoring, and FDR control.


| For more information, please check:
| GitHub Packages: https://github.com/lazear/sage/pkgs/container/sage 
| Home page: https://github.com/lazear/sage

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.8.1
  * - BELL
    - 0.8.1
  * - GAUTSCHI
    - 0.8.1
  * - NEGISHI
    - 0.8.1
  * - SCHOLAR
    - 0.8.1

Commands
~~~~~~~
- sage

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load sage

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run sage on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=sage
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers sage
