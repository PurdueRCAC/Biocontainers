.. _backbone-label:

Pepper_deepvariant
==============================

Introduction
~~~~~~~~
PEPPER is a genome inference module based on recurrent neural networks that enables long-read variant calling and nanopore assembly polishing in the PEPPER-Margin-DeepVariant pipeline. This pipeline enables nanopore-based variant calling with DeepVariant.
For more information, please check:
Docker hub: https://hub.docker.com/r/kishwars/pepper_deepvariant 
Home page: https://github.com/kishwarshafin/pepper

Versions
~~~~~~~~
- r0.4.1

Commands
~~~~~~~
- run_pepper_margin_deepvariant

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pepper_deepvariant

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pepper_deepvariant on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 32
    #SBATCH --job-name=pepper_deepvariant
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pepper_deepvariant

    BASE=$PWD

    # Set up input data
    INPUT_DIR="${BASE}/input/data"
    REF="GRCh38_no_alt.chr20.fa"
    BAM="HG002_ONT_2_GRCh38.chr20.quickstart.bam"

    # Set the number of CPUs to use
    THREADS=32

    # Set up output directory
    OUTPUT_DIR="${BASE}/output"
    OUTPUT_PREFIX="HG002_ONT_2_GRCh38_PEPPER_Margin_DeepVariant.chr20"
    OUTPUT_VCF="HG002_ONT_2_GRCh38_PEPPER_Margin_DeepVariant.chr20.vcf.gz"
    TRUTH_VCF="HG002_GRCh38_1_22_v4.2.1_benchmark.quickstart.vcf.gz"
    TRUTH_BED="HG002_GRCh38_1_22_v4.2.1_benchmark_noinconsistent.quickstart.bed"

    # Create local directory structure
    mkdir -p "${OUTPUT_DIR}"
    mkdir -p "${INPUT_DIR}"

    # Download the data to input directory
    wget -P ${INPUT_DIR} https://storage.googleapis.com/pepper-deepvariant-public/quickstart_data/HG002_ONT_2_GRCh38.chr20.quickstart.bam
    wget -P ${INPUT_DIR} https://storage.googleapis.com/pepper-deepvariant-public/quickstart_data/HG002_ONT_2_GRCh38.chr20.quickstart.bam.bai
    wget -P ${INPUT_DIR} https://storage.googleapis.com/pepper-deepvariant-public/quickstart_data/GRCh38_no_alt.chr20.fa
    wget -P ${INPUT_DIR} https://storage.googleapis.com/pepper-deepvariant-public/quickstart_data/GRCh38_no_alt.chr20.fa.fai
    wget -P ${INPUT_DIR} https://storage.googleapis.com/pepper-deepvariant-public/quickstart_data/HG002_GRCh38_1_22_v4.2.1_benchmark.quickstart.vcf.gz
    wget -P ${INPUT_DIR} https://storage.googleapis.com/pepper-deepvariant-public/quickstart_data/HG002_GRCh38_1_22_v4.2.1_benchmark_noinconsistent.quickstart.bed

    run_pepper_margin_deepvariant call_variant \
        -b input/data/HG002_ONT_2_GRCh38.chr20.quickstart.bam \
        -f input/data/GRCh38_no_alt.chr20.fa -o output \
        -p HG002_ONT_2_GRCh38_PEPPER_Margin_DeepVariant.chr20 \
        -t 32 -r chr20:1000000-1020000 \
        --ont_r9_guppy5_sup --ont
