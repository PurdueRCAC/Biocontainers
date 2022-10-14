.. _backbone-label:

Biobambam
==============================

Introduction
~~~~~~~~
``Biobambam`` is a collection of tools for early stage alignment file processing. | For more information, please check its website: https://biocontainers.pro/tools/biobambam and its home page on `Gitlab`_.

Versions
~~~~~~~~
- 2.0.183

Commands
~~~~~~~
- bam12auxmerge
- bam12split
- bam12strip
- bamadapterclip
- bamadapterfind
- bamalignfrac
- bamauxmerge
- bamauxmerge2
- bamauxsort
- bamcat
- bamchecksort
- bamclipXT
- bamclipreinsert
- bamcollate2
- bamdepth
- bamdepthintersect
- bamdifference
- bamdownsamplerandom
- bamexplode
- bamexploderef
- bamfastcat
- bamfastexploderef
- bamfastnumextract
- bamfastsplit
- bamfeaturecount
- bamfillquery
- bamfilteraux
- bamfiltereofblocks
- bamfilterflags
- bamfilterheader
- bamfilterheader2
- bamfilterk
- bamfilterlength
- bamfiltermc
- bamfilternames
- bamfilterrefid
- bamfilterrg
- bamfixmateinformation
- bamfixpairinfo
- bamflagsplit
- bamindex
- bamintervalcomment
- bamintervalcommenthist
- bammapdist
- bammarkduplicates
- bammarkduplicates2
- bammarkduplicatesopt
- bammaskflags
- bammdnm
- bammerge
- bamnumericalindex
- bamnumericalindexstats
- bamrank
- bamranksort
- bamrecalculatecigar
- bamrecompress
- bamrefextract
- bamrefinterval
- bamreheader
- bamreplacechecksums
- bamreset
- bamscrapcount
- bamseqchksum
- bamsormadup
- bamsort
- bamsplit
- bamsplitdiv
- bamstreamingmarkduplicates
- bamtofastq
- bamvalidate
- bamzztoname

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load biobambam

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Biobambam on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=biobambam
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers biobambam

    bammarkduplicates I=Aligned.sortedByCoord.out.bam O=out.bam D=duplcate_out

    bamsort I=Aligned.sortedByCoord.out.bam O=sorted.bam sortthreads=8

    bamtofastq filename=Aligned.sortedByCoord.out.bam outputdir=fastq_out

.. _Gitlab: https://gitlab.com/german.tischler/biobambam2
