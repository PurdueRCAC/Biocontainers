.. _backbone-label:  
RSEM
============================== 

Introduction
~~~~~~~
``RSEM`` is a software package for estimating gene and isoform expression levels from RNA-Seq data. Further information can be found here: https://deweylab.github.io/RSEM/. 

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

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
~~~~~ 
- rsem-bam2readdepth
- rsem-bam2wig
- rsem-build-read-index
- rsem-calculate-credibility-intervals
- rsem-calculate-expression
- rsem-control-fdr
- rsem-extract-reference-transcripts
- rsem-generate-data-matrix
- rsem-generate-ngvector
- rsem-gen-transcript-plots
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
- rsem-run-prsem-testing-procedure
- rsem-sam-validator
- rsem-scan-for-paired-end-reads
- rsem-simulate-reads
- rsem-synthesis-reference-transcripts
- rsem-tbam2gbam


Dependencies
~~~~~~
``STAR v2.7.9a``, ``Bowtie v1.2.3``, ``Bowtie2 v2.3.5.1``, ``HISAT2 v2.2.1`` were included in the container image. So users do not need to provide the dependency path in the RSEM parameter.  

Module
~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load rsem/1.3.3

Example job
~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run RSEM on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=rsem
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rsem/1.3.3
    
    rsem-prepare-reference --gtf Homo_sapiens.GRCh38.105.gtf --bowtie Homo_sapiens.GRCh38.dna.primary_assembly.fa Gh38_bowtie  -p 24
    rsem-prepare-reference --gtf Homo_sapiens.GRCh38.105.gtf --bowtie2 Homo_sapiens.GRCh38.dna.primary_assembly.fa Gh38_bowtie2  -p 24
    rsem-prepare-reference --gtf Homo_sapiens.GRCh38.105.gtf --hisat2-hca  Homo_sapiens.GRCh38.dna.primary_assembly.fa Gh38_hisat2  -p 24
    rsem-prepare-reference --gtf Homo_sapiens.GRCh38.105.gtf --star Homo_sapiens.GRCh38.dna.primary_assembly.fa Gh38_star  -p 24
    rsem-calculate-expression --paired-end --star -p 24 SRR12095148_1.fastq SRR12095148_2.fastq  Gh38_star SRR12095148_rsem_expression
