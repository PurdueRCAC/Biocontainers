.. _backbone-label:

Hicexplorer
==============================

Introduction
~~~~~~~~
``Hicexplorer`` is a set of tools to process, normalize and visualize Hi-C data. 

| For more information, please check its website: https://biocontainers.pro/tools/hicexplorer and its home page: https://hicexplorer.readthedocs.io/en/latest/#.

Versions
~~~~~~~~
- 3.7.2

Commands
~~~~~~~
- chicAggregateStatistic
- chicDifferentialTest
- chicExportData
- chicPlotViewpoint
- chicQualityControl
- chicSignificantInteractions
- chicViewpoint
- chicViewpointBackgroundModel
- hicAdjustMatrix
- hicAggregateContacts
- hicAverageRegions
- hicBuildMatrix
- hicCompareMatrices
- hicCompartmentalization
- hicConvertFormat
- hicCorrectMatrix
- hicCorrelate
- hicCreateThresholdFile
- hicDetectLoops
- hicDifferentialTAD
- hicexplorer
- hicFindEnrichedContacts
- hicFindRestSite
- hicFindTADs
- hicHyperoptDetectLoops
- hicHyperoptDetectLoopsHiCCUPS
- hicInfo
- hicInterIntraTAD
- hicMergeDomains
- hicMergeLoops
- hicMergeMatrixBins
- hicMergeTADbins
- hicNormalize
- hicPCA
- hicPlotAverageRegions
- hicPlotDistVsCounts
- hicPlotMatrix
- hicPlotSVL
- hicPlotTADs
- hicPlotViewpoint
- hicQC
- hicQuickQC
- hicSumMatrices
- hicTADClassifier
- hicTrainTADClassifier
- hicTransform
- hicValidateLocations

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load hicexplorer

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Hicexplorer on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=hicexplorer
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers hicexplorer
