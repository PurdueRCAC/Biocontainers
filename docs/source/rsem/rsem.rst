.. _backbone-label:

Rsem
==============================

Introduction
~~~~~~~~
Rsem is a software package for estimating gene and isoform expression levels from RNA-Seq data.


| For more information, please check:
| Dockerhub: https://hub.docker.com/r/zhan4429/rsem 
| Home page: https://github.com/deweylab/RSEM

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
    - 1.3.3
  * - BELL
    - 1.3.3
  * - GAUTSCHI
    - 1.3.3
  * - NEGISHI
    - 1.3.3
  * - SCHOLAR
    - 1.3.3

Commands
~~~~~~~
- rsem-bam2readdepth
- rsem-bam2wig
- rsem-build-read-index
- rsem-calculate-credibility-intervals
- rsem-calculate-expression
- rsem-control-fdr
- rsem-extract-reference-transcripts
- rsem-for-ebseq-calculate-clustering-info
- rsem-for-ebseq-find-DE
- rsem-for-ebseq-generate-ngvector-from-clustering-info
- rsem-gen-transcript-plots
- rsem-generate-data-matrix
- rsem-get-unique
- rsem-gff3-to-gtf
- rsem-parse-alignments
- rsem-plot-model
- rsem-plot-transcript-wiggles
- rsem-prepare-reference
- rsem-preref
- rsem-refseq-extract-primary-assembly
- rsem-run-ebseq
- rsem-run-em
- rsem-run-gibbs
- rsem-sam-validator
- rsem-scan-for-paired-end-reads
- rsem-simulate-reads
- rsem-synthesis-reference-transcripts
- rsem-tbam2gbam

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load rsem

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rsem on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=rsem
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rsem
