.. _backbone-label:

Deepvariant
==============================

Introduction
~~~~~~~~
DeepVariant is a deep learning-based variant caller that takes aligned reads (in BAM or CRAM format), produces pileup image tensors from them, classifies each tensor using a convolutional neural network, and finally reports the results in a standard VCF or gVCF file.
For more information, please check:
Home page: https://github.com/google/deepvariant

Versions
~~~~~~~~
- 1.0.0
- 1.1.0

Commands
~~~~~~~
- call_variants
- get-pip.py
- make_examples
- model_eval
- model_train
- postprocess_variants
- run-prereq.sh
- run_deepvariant
- run_deepvariant.py
- settings.sh
- show_examples
- vcf_stats_report

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load deepvariant

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run deepvariant on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=deepvariant
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers deepvariant
    
    INPUT_DIR="${PWD}/quickstart-testdata"
    DATA_HTTP_DIR="https://storage.googleapis.com/deepvariant/quickstart-testdata"
    mkdir -p ${INPUT_DIR}
    wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/NA12878_S1.chr20.10_10p1mb.bam
    wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/NA12878_S1.chr20.10_10p1mb.bam.bai
    wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/test_nist.b37_chr20_100kbp_at_10mb.bed
    wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/test_nist.b37_chr20_100kbp_at_10mb.vcf.gz
    wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/test_nist.b37_chr20_100kbp_at_10mb.vcf.gz.tbi
    wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/ucsc.hg19.chr20.unittest.fasta
    wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/ucsc.hg19.chr20.unittest.fasta.fai
    wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/ucsc.hg19.chr20.unittest.fasta.gz
    wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/ucsc.hg19.chr20.unittest.fasta.gz.fai
    wget -P ${INPUT_DIR} "${DATA_HTTP_DIR}"/ucsc.hg19.chr20.unittest.fasta.gz.gzi
       
    run_deepvariant --model_type=WGS --ref="${INPUT_DIR}"/ucsc.hg19.chr20.unittest.fasta  --reads="${INPUT_DIR}"/NA12878_S1.chr20.10_10p1mb.bam  --regions "chr20:10,000,000-10,010,000"  --output_vcf="output/output.vcf.gz"  --output_gvcf="output/output.g.vcf.gz" --intermediate_results_dir "output/intermediate_results_dir"  --num_shards=4
