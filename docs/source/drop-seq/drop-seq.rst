.. _backbone-label:

Drop-seq
==============================

Introduction
~~~~~~~~
Drop-seq are java tools for analyzing Drop-seq data.


| For more information, please check:
| Home page: https://github.com/broadinstitute/Drop-seq

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
    - 2.5.2
  * - BELL
    - 2.5.2
  * - GAUTSCHI
    - 2.5.2
  * - NEGISHI
    - 2.5.2
  * - SCHOLAR
    - 2.5.2

Commands
~~~~~~~
- AssignCellsToSamples
- BamTagHistogram
- BamTagOfTagCounts
- BaseDistributionAtReadPosition
- BipartiteRabiesVirusCollapse
- CensusSeq
- CollapseBarcodesInPlace
- CollapseTagWithContext
- CompareDropSeqAlignments
- ComputeUMISharing
- ConvertTagToReadGroup
- ConvertToRefFlat
- CountUnmatchedSampleIndices
- CreateIntervalsFiles
- CreateMetaCells
- CreateSnpIntervalFromVcf
- CsiAnalysis
- DetectBeadSubstitutionErrors
- DetectBeadSynthesisErrors
- DetectDoublets
- DigitalExpression
- DownsampleBamByTag
- DownsampleTranscriptsAndQuantiles
- Drop-seq_Alignment_Cookbook.pdf
- Drop-seq_alignment.sh
- FilterBam
- FilterBamByGeneFunction
- FilterBamByTag
- FilterDge
- FilterGtf
- FilterValidRabiesBarcodes
- GatherGeneGCLength
- GatherMolecularBarcodeDistributionByGene
- GatherReadQualityMetrics
- GenotypeSperm
- MaskReferenceSequence
- MergeDgeSparse
- PolyATrimmer
- ReduceGtf
- RollCall
- SelectCellsByNumTranscripts
- SignTest
- SingleCellRnaSeqMetricsCollector
- SpermSeqMarkDuplicates
- SplitBamByCell
- TagBam
- TagBamWithReadSequenceExtended
- TagReadWithGeneExonFunction
- TagReadWithGeneFunction
- TagReadWithInterval
- TagReadWithRabiesBarcodes
- TrimStartingSequence
- ValidateAlignedSam
- ValidateReference
- create_Drop-seq_reference_metadata.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load drop-seq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run drop-seq on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=drop-seq
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers drop-seq

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=drop-seq
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers drop-seq

   .. tab-item:: Gautschi-AI/Gilbreth

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p a100        # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=drop-seq
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers drop-seq

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=drop-seq
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers drop-seq
