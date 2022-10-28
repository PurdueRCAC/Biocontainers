.. _backbone-label:  

Kallisto
============================== 

Introduction
~~~~~~~
``Kallisto`` is a program for quantifying abundances of transcripts from RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads. It is based on the novel idea of pseudoalignment for rapidly determining the compatibility of reads with targets, without the need for alignment. 

Detailed usage can be found here: https://github.com/pachterlab/kallisto


Versions
~~~~~~~~
- 0.46.2
- 0.48.0

Commands
~~~~~~
- kallisto

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load kallisto/0.48.0

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run kallisto on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=kallisto
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kallisto/0.48.0
    
    kallisto index -i transcripts.idx Homo_sapiens.GRCh38.cds.all.fa.gz
    kallisto quant -t 24 -i transcripts.idx -o output -b 100  SRR11614709_1.fastq  SRR11614709_2.fastq
