.. _backbone-label:

Ngs-bits
==============================

Introduction
~~~~~~~~
Ngs-bits - Short-read sequencing tools.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/ngs-bits 
| Home page: https://github.com/imgag/ngs-bits

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
    - 2022_04
  * - BELL
    - 2022_04
  * - GAUTSCHI
    - 2022_04
  * - NEGISHI
    - 2022_04
  * - SCHOLAR
    - 2022_04

Commands
~~~~~~~
- SampleAncestry
- SampleDiff
- SampleGender
- SampleOverview
- SampleSimilarity
- SeqPurge
- CnvHunter
- RohHunter
- UpdHunter
- CfDnaQC
- MappingQC
- NGSDImportQC
- ReadQC
- SomaticQC
- VariantQC
- TrioMaternalContamination
- BamCleanHaloplex
- BamClipOverlap
- BamDownsample
- BamFilter
- BamToFastq
- BedAdd
- BedAnnotateFreq
- BedAnnotateFromBed
- BedAnnotateGC
- BedAnnotateGenes
- BedChunk
- BedCoverage
- BedExtend
- BedGeneOverlap
- BedHighCoverage
- BedInfo
- BedIntersect
- BedLiftOver
- BedLowCoverage
- BedMerge
- BedReadCount
- BedShrink
- BedSort
- BedSubtract
- BedToFasta
- BedpeAnnotateBreakpointDensity
- BedpeAnnotateCnvOverlap
- BedpeAnnotateCounts
- BedpeAnnotateFromBed
- BedpeFilter
- BedpeGeneAnnotation
- BedpeSort
- BedpeToBed
- FastqAddBarcode
- FastqConcat
- FastqConvert
- FastqDownsample
- FastqExtract
- FastqExtractBarcode
- FastqExtractUMI
- FastqFormat
- FastqList
- FastqMidParser
- FastqToFasta
- FastqTrim
- VcfAnnotateFromBed
- VcfAnnotateFromBigWig
- VcfAnnotateFromVcf
- VcfBreakMulti
- VcfCalculatePRS
- VcfCheck
- VcfExtractSamples
- VcfFilter
- VcfLeftNormalize
- VcfSort
- VcfStreamSort
- VcfToBedpe
- VcfToTsv
- SvFilterAnnotations
- NGSDExportGenes
- GenePrioritization
- GenesToApproved
- GenesToBed
- GraphStringDb
- PhenotypeSubtree
- PhenotypesToGenes
- PERsim
- FastaInfo

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ngs-bits

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ngs-bits on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=ngs-bits
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers ngs-bits

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=ngs-bits
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers ngs-bits

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
        #SBATCH --job-name=ngs-bits
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers ngs-bits

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=ngs-bits
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers ngs-bits
