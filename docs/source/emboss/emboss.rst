.. _backbone-label:

Emboss
==============================

Introduction
~~~~~~~~
``Emboss`` is "The European Molecular Biology Open Software Suite". 

| For more information, please check its website: https://biocontainers.pro/tools/emboss and its home page: http://emboss.open-bio.org.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 6.6.0
  * - BELL
    - 6.6.0
  * - GAUTSCHI
    - 6.6.0
  * - NEGISHI
    - 6.6.0
  * - SCHOLAR
    - 6.6.0

Commands
~~~~~~~
- aaindexextract
- abiview
- acdc
- acdgalaxy
- acdlog
- acdpretty
- acdtable
- acdtrace
- acdvalid
- aligncopy
- aligncopypair
- antigenic
- assemblyget
- backtranambig
- backtranseq
- banana
- biosed
- btwisted
- cachedas
- cachedbfetch
- cacheebeyesearch
- cacheensembl
- cai
- chaos
- charge
- checktrans
- chips
- cirdna
- codcmp
- codcopy
- coderet
- compseq
- cons
- consambig
- cpgplot
- cpgreport
- cusp
- cutgextract
- cutseq
- dan
- dbiblast
- dbifasta
- dbiflat
- dbigcg
- dbtell
- dbxcompress
- dbxedam
- dbxfasta
- dbxflat
- dbxgcg
- dbxobo
- dbxreport
- dbxresource
- dbxstat
- dbxtax
- dbxuncompress
- degapseq
- density
- descseq
- diffseq
- distmat
- dotmatcher
- dotpath
- dottup
- dreg
- drfinddata
- drfindformat
- drfindid
- drfindresource
- drget
- drtext
- edamdef
- edamhasinput
- edamhasoutput
- edamisformat
- edamisid
- edamname
- edialign
- einverted
- embossdata
- embossupdate
- embossversion
- emma
- emowse
- entret
- epestfind
- eprimer3
- eprimer32
- equicktandem
- est2genome
- etandem
- extractalign
- extractfeat
- extractseq
- featcopy
- featmerge
- featreport
- feattext
- findkm
- freak
- fuzznuc
- fuzzpro
- fuzztran
- garnier
- geecee
- getorf
- godef
- goname
- helixturnhelix
- hmoment
- iep
- infoalign
- infoassembly
- infobase
- inforesidue
- infoseq
- isochore
- jaspextract
- jaspscan
- jembossctl
- lindna
- listor
- makenucseq
- makeprotseq
- marscan
- maskambignuc
- maskambigprot
- maskfeat
- maskseq
- matcher
- megamerger
- merger
- msbar
- mwcontam
- mwfilter
- needle
- needleall
- newcpgreport
- newcpgseek
- newseq
- nohtml
- noreturn
- nospace
- notab
- notseq
- nthseq
- nthseqset
- octanol
- oddcomp
- ontocount
- ontoget
- ontogetcommon
- ontogetdown
- ontogetobsolete
- ontogetroot
- ontogetsibs
- ontogetup
- ontoisobsolete
- ontotext
- palindrome
- pasteseq
- patmatdb
- patmatmotifs
- pepcoil
- pepdigest
- pepinfo
- pepnet
- pepstats
- pepwheel
- pepwindow
- pepwindowall
- plotcon
- plotorf
- polydot
- preg
- prettyplot
- prettyseq
- primersearch
- printsextract
- profit
- prophecy
- prophet
- prosextract
- pscan
- psiphi
- rebaseextract
- recoder
- redata
- refseqget
- remap
- restover
- restrict
- revseq
- runJemboss.sh
- seealso
- seqcount
- seqmatchall
- seqret
- seqretsetall
- seqretsplit
- seqxref
- seqxrefget
- servertell
- showalign
- showdb
- showfeat
- showorf
- showpep
- showseq
- showserver
- shuffleseq
- sigcleave
- silent
- sirna
- sixpack
- sizeseq
- skipredundant
- skipseq
- splitsource
- splitter
- stretcher
- stssearch
- supermatcher
- syco
- taxget
- taxgetdown
- taxgetrank
- taxgetspecies
- taxgetup
- tcode
- textget
- textsearch
- tfextract
- tfm
- tfscan
- tmap
- tranalign
- transeq
- trimest
- trimseq
- trimspace
- twofeat
- union
- urlget
- variationget
- vectorstrip
- water
- whichdb
- wobble
- wordcount
- wordfinder
- wordmatch
- wossdata
- wossinput
- wossname
- wossoperation
- wossoutput
- wossparam
- wosstopic
- xmlget
- xmltext
- yank

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load emboss

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Emboss on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=emboss
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers emboss
