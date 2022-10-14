.. _backbone-label:

DeepTools
==============================

Introduction
~~~~~~~~
``DeepTools`` is a collection of user-friendly tools for normalization and visualization of deep-sequencing data. | For more information, please check its website: https://biocontainers.pro/tools/deeptools and its home page on `Github`_.

Versions
~~~~~~~~
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

To run DeepTools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=deeptools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers deeptools
    
    bamCoverage  --normalizeUsing CPM -p 32  \
         --effectiveGenomeSize  11000000  \
         -b WT_coord_sorted.bam  \
         -o WT_coord_sorted.bw  

.. _Github: https://github.com/deeptools/deepTools
