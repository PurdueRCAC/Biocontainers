.. _backbone-label:

Homer2
==============================

Introduction
~~~~~~~~
HOMER is a suite of tools for Motif Discovery and next-gen sequencing analysis.


| For more information, please check:
| Home page: http://homer.ucsd.edu/homer/

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
    - 5.1
  * - BELL
    - 5.1
  * - GAUTSCHI
    - 5.1
  * - NEGISHI
    - 5.1

Commands
~~~~~~~
- configureHomer.pl
- GenomeOntology.pl
- HomerConfig.pm
- HomerSVGLogo.pm
- HomerSeqBias.pm
- SIMA.pl
- Statistics.pm
- addData.pl
- addDataHeader.pl
- addGeneAnnotation.pl
- addInternalData.pl
- addOligos.pl
- adjustPeakFile.pl
- adjustPvalueMatrix.pl
- adjustRedunGroupFile.pl
- analyzeChIP-Seq.pl
- analyzeClusters.pl
- analyzeHiC
- analyzeRNA.pl
- analyzeRepeats.pl
- annotateInteractions.pl
- annotatePeaks.pl
- annotateRelativePosition.pl
- annotateTranscripts.pl
- assignGeneWeights.pl
- assignGenomeAnnotation
- assignTSStoGene.pl
- batchAnnotatePeaksHistogram.pl
- batchFindMotifs.pl
- batchFindMotifsGenome.pl
- batchMakeHiCMatrix.pl
- batchMakeMultiWigHub.pl
- batchMakeTagDirectory.pl
- batchParallel.pl
- bed2DtoUCSCbed.pl
- bed2pos.pl
- bed2tag.pl
- blat2gtf.pl
- bridgeResult2Cytoscape.pl
- calcScore.pl
- changeNewLine.pl
- checkPeakFile.pl
- checkTagBias.pl
- chopUpBackground.pl
- chopUpPeakFile.pl
- chopify.pl
- cleanUpPeakFile.pl
- cleanUpSequences.pl
- cluster2bed.pl
- cluster2bedgraph.pl
- combineGO.pl
- combineHubs.pl
- compareMotifs.pl
- condenseBedGraph.pl
- cons2fasta.pl
- conservationAverage.pl
- conservationPerLocus.pl
- convertCoordinates.pl
- convertIDs.pl
- convertOrganismID.pl
- createHomer2EnrichmentTable.pl
- createIGVhtml.pl
- createScoredFasta.pl
- duplicateCol.pl
- eland2tags.pl
- fasta2tab.pl
- fastq2fasta.pl
- filterListBy.pl
- filterTADsAndCPs.pl
- filterTADsAndLoops.pl
- filterTagDirectory.pl
- findGO.pl
- findGOtxt.pl
- findHiCCompartments.pl
- findHiCDomains.pl
- findHiCInteractionsByChr.pl
- findKnownMotifs.pl
- findMotifs.pl
- findMotifsGenome.pl
- findPeaks
- findRedundantBLAT.pl
- findTADsAndLoops.pl
- findTADsAndLoopsFromRelMatrix
- findTopMotifs.pl
- findcsRNATSR.pl
- findcsRNATSS.pl
- flipPC1toMatch.pl
- freq2group.pl
- genericConvertIDs.pl
- genomeOntology
- getChrLengths.pl
- getConservedRegions.pl
- getDiffExpression.pl
- getDifferentialBedGraph.pl
- getDifferentialPeaks
- getDifferentialPeaksReplicates.pl
- getDistalPeaks.pl
- getFocalPeaks.pl
- getGWASoverlap.pl
- getGenesInCategory.pl
- getGenomeTilingPeaks
- getHiCcorrDiff.pl
- getHomerQCstats.pl
- getLikelyAdapters.pl
- getMappableRegions
- getMappingStats.pl
- getPartOfPromoter.pl
- getPeakTags
- getPos.pl
- getRandomReads.pl
- getSiteConservation.pl
- getTSSfromReads.pl
- getTopPeaks.pl
- gff2pos.pl
- go2cytoscape.pl
- groupSequences.pl
- homer
- homer2
- homer2jaspar.pl
- homerTools
- joinFiles.pl
- loadGenome.pl
- loadPromoters.pl
- makeBigBedMotifTrack.pl
- makeBigWig.pl
- makeBinaryFile.pl
- makeHiCWashUfile.pl
- makeMetaGeneProfile.pl
- makeMultiWigHub.pl
- makeTagDirectory
- makeUCSCfile
- map-fastq.pl
- merge2Dbed.pl
- mergeData.pl
- mergePeaks
- motif2Jaspar.pl
- motif2Logo.pl
- pacifierHomer2.pl
- parseGTF.pl
- pos2bed.pl
- powerSpec.pl
- prepForR.pl
- preparseGenome.pl
- profile2seq.pl
- qseq2fastq.pl
- randRemoveBackground.pl
- randomizeGroupFile.pl
- randomizeMotif.pl
- randomizeMotifs.pl
- removeAccVersion.pl
- removeBadSeq.pl
- removeOutOfBoundsReads.pl
- removePoorSeq.pl
- removeRedundantPeaks.pl
- renamePeaks.pl
- resizePosFile.pl
- revoppMotif.pl
- rotateHiCmatrix.pl
- runHiCpca.pl
- sam2spliceJunc.pl
- scanMotifGenomeWide.pl
- scrambleFasta.pl
- script-findAllTSS.pl
- selectRepeatBg.pl
- seq2profile.pl
- subtractBedGraphs.pl
- subtractBedGraphsDirectory.pl
- tab2fasta.pl
- tag2bed.pl
- tag2pos.pl
- tagDir2HiCsummary.pl
- tagDir2bed.pl
- tagDir2hicFile.pl
- zipHomerResults.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load homer2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run homer2 on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=homer2
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers homer2

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=homer2
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers homer2

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
        #SBATCH --job-name=homer2
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers homer2

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=homer2
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers homer2
