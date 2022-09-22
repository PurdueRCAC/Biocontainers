.. _backbone-label:  
HOMMER
============================== 
Introduction
~~~~~~~
``HOMMER`` (Hypergeometric Optimization of Motif EnRichment) is a suite of tools for Motif Discovery and next-gen sequencing analysis. Details about its usage can be found in `HOMMER website`_.  

Versions
~~~~~~~~
- 4.11

Commands
~~~~~~~
- addDataHeader.pl
- addData.pl
- addGeneAnnotation.pl
- addInternalData.pl
- addOligos.pl
- adjustPeakFile.pl
- adjustRedunGroupFile.pl
- analyzeChIP-Seq.pl
- analyzeRepeats.pl
- analyzeRNA.pl
- annotateInteractions.pl
- annotatePeaks.pl
- annotateRelativePosition.pl
- annotateTranscripts.pl
- assignGeneWeights.pl
- assignTSStoGene.pl
- batchAnnotatePeaksHistogram.pl
- batchFindMotifsGenome.pl
- batchFindMotifs.pl
- batchMakeHiCMatrix.pl
- batchMakeMultiWigHub.pl
- batchMakeTagDirectory.pl
- batchParallel.pl
- bed2DtoUCSCbed.pl
- bed2pos.pl
- bed2tag.pl
- blat2gtf.pl
- bridgeResult2Cytoscape.pl
- changeNewLine.pl
- checkPeakFile.pl
- checkTagBias.pl
- chopify.pl
- chopUpBackground.pl
- chopUpPeakFile.pl
- cleanUpPeakFile.pl
- cleanUpSequences.pl
- cluster2bedgraph.pl
- cluster2bed.pl
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
- duplicateCol.pl
- eland2tags.pl
- fasta2tab.pl
- fastq2fasta.pl
- filterListBy.pl
- filterTADsAndCPs.pl
- filterTADsAndLoops.pl
- findcsRNATSS.pl
- findGO.pl
- findGOtxt.pl
- findHiCCompartments.pl
- findHiCDomains.pl
- findHiCInteractionsByChr.pl
- findKnownMotifs.pl
- findMotifsGenome.pl
- findMotifs.pl
- findRedundantBLAT.pl
- findTADsAndLoops.pl
- findTopMotifs.pl
- flipPC1toMatch.pl
- freq2group.pl
- genericConvertIDs.pl
- GenomeOntology.pl
- getChrLengths.pl
- getConservedRegions.pl
- getDifferentialBedGraph.pl
- getDifferentialPeaksReplicates.pl
- getDiffExpression.pl
- getDistalPeaks.pl
- getFocalPeaks.pl
- getGenesInCategory.pl
- getGWASoverlap.pl
- getHiCcorrDiff.pl
- getHomerQCstats.pl
- getLikelyAdapters.pl
- getMappingStats.pl
- getPartOfPromoter.pl
- getPos.pl
- getRandomReads.pl
- getSiteConservation.pl
- getTopPeaks.pl
- gff2pos.pl
- go2cytoscape.pl
- groupSequences.pl
- joinFiles.pl
- loadGenome.pl
- loadPromoters.pl
- makeBigBedMotifTrack.pl
- makeBigWig.pl
- makeBinaryFile.pl
- makeHiCWashUfile.pl
- makeMetaGeneProfile.pl
- makeMultiWigHub.pl
- map-fastq.pl
- merge2Dbed.pl
- mergeData.pl
- motif2Jaspar.pl
- motif2Logo.pl
- parseGTF.pl
- pos2bed.pl
- preparseGenome.pl
- prepForR.pl
- profile2seq.pl
- qseq2fastq.pl
- randomizeGroupFile.pl
- randomizeMotifs.pl
- randRemoveBackground.pl
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
- selectRepeatBg.pl
- seq2profile.pl
- SIMA.pl
- subtractBedGraphsDirectory.pl
- subtractBedGraphs.pl
- tab2fasta.pl
- tag2bed.pl
- tag2pos.pl
- tagDir2bed.pl
- tagDir2hicFile.pl
- tagDir2HiCsummary.pl
- zipHomerResults.pl

Database
~~~~~
Selected database have been downloaded for users.

- ``ORGANISMS``: yeast, worm, mouse, arabidopsis, zebrafish, rat, human and fly
- ``PROMOTERS``: yeast, worm, mouse, arabidopsis, zebrafish, rat, human and fly
- ``GENOMES``: hg19, hg38, mm10, ce11, dm6, rn6, danRer11, tair10, and sacCer3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load hommer/4.11
    
    
Example job
~~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run HOMMER on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation	# Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=hommer
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers hommer/4.11
    
    configureHomer.pl -list   ## Check the installed database. 
    findMotifs.pl mouse_geneid.txt mouse motif_out_mouse
    findMotifs.pl geneid.txt human motif_out
    
    
.. _HOMMER website: http://homer.ucsd.edu/homer/index.html. 
