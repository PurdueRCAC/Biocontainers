.. _backbone-label:

Ascatngs
==============================

Introduction
~~~~~~~~
AscatNGS contains the Cancer Genome Projects workflow implementation of the ASCAT copy number algorithm for paired end sequencing.


| For more information, please check:
| Quay.io: https://quay.io/repository/wtsicgp/ascatngs 
| Home page: https://github.com/cancerit/ascatNgs

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 4.5.0
  * - BELL
    - 4.5.0
  * - GAUTSCHI
    - 4.5.0
  * - NEGISHI
    - 4.5.0
  * - SCHOLAR
    - 4.5.0

Commands
~~~~~~~
- alleleCounter.pl
- ascatCnToVCF.pl
- ascatCounts.pl
- ascatFaiChunk.pl
- ascatFailedCnCsv.pl
- ascat.pl
- ascatSnpPanelFromVcfs.pl
- ascatSnpPanelGcCorrections.pl
- ascatSnpPanelGenerator.pl
- ascatSnpPanelMerge.pl
- ascatToBigWig.pl
- bamToBw.pl
- blast2sam.pl
- bowtie2sam.pl
- bwa_aln.pl
- bwa_mem.pl
- cgpAppendIdsToVcf.pl
- cgpVCFSplit.pl
- export2sam.pl
- interpolate_sam.pl
- merge_or_mark.pl
- novo2sam.pl
- pkg-config.pl
- psl2sam.pl
- sam2vcf.pl
- samtools.pl
- seq_cache_populate.pl
- soap2sam.pl
- stag-autoschema.pl
- stag-db.pl
- stag-diff.pl
- stag-drawtree.pl
- stag-filter.pl
- stag-findsubtree.pl
- stag-flatten.pl
- stag-grep.pl
- stag-handle.pl
- stag-itext2simple.pl
- stag-itext2sxpr.pl
- stag-itext2xml.pl
- stag-join.pl
- stag-merge.pl
- stag-mogrify.pl
- stag-parse.pl
- stag-query.pl
- stag-splitter.pl
- stag-view.pl
- stag-xml2itext.pl
- wgsim_eval.pl
- xam_coverage_bins.pl
- zoom2sam.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ascatngs

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ascatngs on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ascatngs
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ascatngs
