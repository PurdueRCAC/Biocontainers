.. _backbone-label:

Deeptools
==============================

Introduction
~~~~~~~~
DeepTools is a collection of user-friendly tools for normalization and visualization of deep-sequencing data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/deeptools 
| Home page: https://github.com/deeptools/deepTools

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
    - 3.5.1-py, 3.5.5
  * - BELL
    - 3.5.1-py, 3.5.5
  * - GAUTSCHI
    - 3.5.1-py, 3.5.5
  * - NEGISHI
    - 3.5.1-py, 3.5.5
  * - SCHOLAR
    - 3.5.1-py

Commands
~~~~~~~
- alignmentSieve
- bamCompare
- bamCoverage
- bamPEFragmentSize
- bigwigCompare
- computeGCBias
- computeMatrix
- computeMatrixOperations
- correctGCBias
- deeptools
- estimateReadFiltering
- estimateScaleFactor
- multiBamSummary
- multiBigwigSummary
- plotCorrelation
- plotCoverage
- plotEnrichment
- plotFingerprint
- plotHeatmap
- plotPCA
- plotProfile

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load deeptools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run deeptools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=deeptools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers deeptools
