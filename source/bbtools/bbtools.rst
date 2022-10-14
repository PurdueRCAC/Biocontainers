.. _backbone-label:

Bbtools
==============================

Introduction
~~~~~~~~
BBTools is a suite of fast, multithreaded bioinformatics tools designed for analysis of DNA and RNA sequence data.
|For more information, please check:
|Docker hub: https://hub.docker.com/r/staphb/bbtools 
|Home page: https://jgi.doe.gov/data-and-tools/software-tools/bbtools/

Versions
~~~~~~~~
- 39.00

Commands
~~~~~~~
- Xcalcmem.sh
- a_sample_mt.sh
- addadapters.sh
- addssu.sh
- adjusthomopolymers.sh
- alltoall.sh
- analyzeaccession.sh
- analyzegenes.sh
- analyzesketchresults.sh
- applyvariants.sh
- bbcms.sh
- bbcountunique.sh
- bbduk.sh
- bbest.sh
- bbfakereads.sh
- bbmap.sh
- bbmapskimmer.sh
- bbmask.sh
- bbmerge-auto.sh
- bbmerge.sh
- bbnorm.sh
- bbrealign.sh
- bbrename.sh
- bbsketch.sh
- bbsplit.sh
- bbsplitpairs.sh
- bbstats.sh
- bbversion.sh
- bbwrap.sh
- bloomfilter.sh
- calcmem.sh
- calctruequality.sh
- callgenes.sh
- callpeaks.sh
- callvariants.sh
- callvariants2.sh
- clumpify.sh
- commonkmers.sh
- comparegff.sh
- comparesketch.sh
- comparessu.sh
- comparevcf.sh
- consect.sh
- consensus.sh
- countbarcodes.sh
- countgc.sh
- countsharedlines.sh
- crossblock.sh
- crosscontaminate.sh
- cutgff.sh
- cutprimers.sh
- decontaminate.sh
- dedupe.sh
- dedupe2.sh
- dedupebymapping.sh
- demuxbyname.sh
- diskbench.sh
- estherfilter.sh
- explodetree.sh
- fetchproks.sh
- filterassemblysummary.sh
- filterbarcodes.sh
- filterbycoverage.sh
- filterbyname.sh
- filterbysequence.sh
- filterbytaxa.sh
- filterbytile.sh
- filterlines.sh
- filterqc.sh
- filtersam.sh
- filtersilva.sh
- filtersubs.sh
- filtervcf.sh
- fixgaps.sh
- fungalrelease.sh
- fuse.sh
- gbff2gff.sh
- getreads.sh
- gi2ancestors.sh
- gi2taxid.sh
- gitable.sh
- grademerge.sh
- gradesam.sh
- icecreamfinder.sh
- icecreamgrader.sh
- icecreammaker.sh
- idmatrix.sh
- idtree.sh
- invertkey.sh
- kapastats.sh
- kcompress.sh
- keepbestcopy.sh
- khist.sh
- kmercountexact.sh
- kmercountmulti.sh
- kmercoverage.sh
- kmerfilterset.sh
- kmerlimit.sh
- kmerlimit2.sh
- kmerposition.sh
- kmutate.sh
- lilypad.sh
- loadreads.sh
- loglog.sh
- makechimeras.sh
- makecontaminatedgenomes.sh
- makepolymers.sh
- mapPacBio.sh
- matrixtocolumns.sh
- mergeOTUs.sh
- mergebarcodes.sh
- mergepgm.sh
- mergeribo.sh
- mergesam.sh
- mergesketch.sh
- mergesorted.sh
- msa.sh
- mutate.sh
- muxbyname.sh
- partition.sh
- phylip2fasta.sh
- pileup.sh
- plotflowcell.sh
- plotgc.sh
- postfilter.sh
- printtime.sh
- processfrag.sh
- processhi-c.sh
- processspeed.sh
- randomgenome.sh
- randomreads.sh
- readlength.sh
- readqc.sh
- reducesilva.sh
- reformat.sh
- reformatpb.sh
- removebadbarcodes.sh
- removecatdogmousehuman.sh
- removehuman.sh
- removehuman2.sh
- removemicrobes.sh
- removesmartbell.sh
- rename.sh
- renameimg.sh
- repair.sh
- replaceheaders.sh
- representative.sh
- rqcfilter.sh
- rqcfilter2.sh
- runhmm.sh
- samtoroc.sh
- seal.sh
- sendsketch.sh
- shred.sh
- shrinkaccession.sh
- shuffle.sh
- shuffle2.sh
- sketch.sh
- sketchblacklist.sh
- sketchblacklist2.sh
- sortbyname.sh
- splitbytaxa.sh
- splitnextera.sh
- splitribo.sh
- splitsam.sh
- splitsam4way.sh
- splitsam6way.sh
- stats.sh
- statswrapper.sh
- streamsam.sh
- subsketch.sh
- summarizecontam.sh
- summarizecoverage.sh
- summarizecrossblock.sh
- summarizemerge.sh
- summarizequast.sh
- summarizescafstats.sh
- summarizeseal.sh
- summarizesketch.sh
- synthmda.sh
- tadpipe.sh
- tadpole.sh
- tadwrapper.sh
- taxonomy.sh
- taxserver.sh
- taxsize.sh
- taxtree.sh
- testfilesystem.sh
- testformat.sh
- testformat2.sh
- tetramerfreq.sh
- textfile.sh
- translate6frames.sh
- unicode2ascii.sh
- unzip.sh
- vcf2gff.sh
- webcheck.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bbtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bbtools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bbtools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bbtools
