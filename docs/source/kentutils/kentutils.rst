.. _backbone-label:

Kentutils
==============================

Introduction
~~~~~~~~
Kentutils: UCSC command line bioinformatic utilities.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/genomicpariscentre/kentutils 
| Home page: https://github.com/ENCODE-DCC/kentUtils

Versions
~~~~~~~~
- 302.1.0

Commands
~~~~~~~
- addCols
- ameme
- autoDtd
- autoSql
- autoXml
- ave
- aveCols
- axtChain
- axtSort
- axtSwap
- axtToMaf
- axtToPsl
- bedClip
- bedCommonRegions
- bedCoverage
- bedExtendRanges
- bedGeneParts
- bedGraphPack
- bedGraphToBigWig
- bedIntersect
- bedItemOverlapCount
- bedPileUps
- bedRemoveOverlap
- bedRestrictToPositions
- bedSort
- bedToBigBed
- bedToExons
- bedToGenePred
- bedToPsl
- bedWeedOverlapping
- bigBedInfo
- bigBedNamedItems
- bigBedSummary
- bigBedToBed
- bigWigAverageOverBed
- bigWigCat
- bigWigCorrelate
- bigWigInfo
- bigWigMerge
- bigWigSummary
- bigWigToBedGraph
- bigWigToWig
- blastToPsl
- blastXmlToPsl
- calc
- catDir
- catUncomment
- chainAntiRepeat
- chainFilter
- chainMergeSort
- chainNet
- chainPreNet
- chainSort
- chainSplit
- chainStitchId
- chainSwap
- chainToAxt
- chainToPsl
- checkAgpAndFa
- checkCoverageGaps
- checkHgFindSpec
- checkTableCoords
- chopFaLines
- chromGraphFromBin
- chromGraphToBin
- colTransform
- countChars
- crTreeIndexBed
- crTreeSearchBed
- dbSnoop
- dbTrash
- estOrient
- faCmp
- faCount
- faFilter
- faFilterN
- faFrag
- faNoise
- faOneRecord
- faPolyASizes
- faRandomize
- faRc
- faSize
- faSomeRecords
- faSplit
- faToFastq
- faToTab
- faToTwoBit
- faTrans
- fastqToFa
- featureBits
- fetchChromSizes
- findMotif
- gapToLift
- genePredCheck
- genePredHisto
- genePredSingleCover
- genePredToBed
- genePredToFakePsl
- genePredToGtf
- genePredToMafFrames
- gfClient
- gfServer
- gff3ToGenePred
- gff3ToPsl
- gmtime
- gtfToGenePred
- headRest
- hgFindSpec
- hgGcPercent
- hgLoadBed
- hgLoadOut
- hgLoadWiggle
- hgTrackDb
- hgWiggle
- hgsql
- hgsqldump
- htmlCheck
- hubCheck
- ixIxx
- lavToAxt
- lavToPsl
- ldHgGene
- liftOver
- liftOverMerge
- liftUp
- linesToRa
- linux.x86_64
- localtime
- mafAddIRows
- mafAddQRows
- mafCoverage
- mafFetch
- mafFilter
- mafFrag
- mafFrags
- mafGene
- mafMeFirst
- mafOrder
- mafRanges
- mafSpeciesList
- mafSpeciesSubset
- mafSplit
- mafSplitPos
- mafToAxt
- mafToPsl
- mafsInRegion
- makeTableList
- maskOutFa
- mktime
- mrnaToGene
- netChainSubset
- netClass
- netFilter
- netSplit
- netSyntenic
- netToAxt
- netToBed
- newProg
- nibFrag
- nibSize
- oligoMatch
- overlapSelect
- paraFetch
- paraSync
- positionalTblCheck
- pslCDnaFilter
- pslCat
- pslCheck
- pslDropOverlap
- pslFilter
- pslHisto
- pslLiftSubrangeBlat
- pslMap
- pslMrnaCover
- pslPairs
- pslPartition
- pslPretty
- pslRecalcMatch
- pslReps
- pslSelect
- pslSort
- pslStats
- pslSwap
- pslToBed
- pslToChain
- pslToPslx
- pslxToFa
- qaToQac
- qacAgpLift
- qacToQa
- qacToWig
- raSqlQuery
- raToLines
- raToTab
- randomLines
- rmFaDups
- rowsToCols
- sizeof
- spacedToTab
- splitFile
- splitFileByColumn
- sqlToXml
- stringify
- subChar
- subColumn
- tailLines
- tdbQuery
- textHistogram
- tickToDate
- toLower
- toUpper
- trfBig
- twoBitDup
- twoBitInfo
- twoBitMask
- twoBitToFa
- validateFiles
- validateManifest
- wigCorrelate
- wigEncode
- wigToBigWig
- wordLine
- xmlCat
- xmlToSql

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load kentutils

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run kentutils on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=kentutils
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kentutils
