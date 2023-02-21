.. _backbone-label:  

STAR
============================== 

Introduction
~~~~~~~
``STAR``: ultrafast universal RNA-seq aligner.

Detailed usage can be found here: https://github.com/alexdobin/STAR

Versions
~~~~~~~~
- 2.7.10a
- 2.7.10b
- 2.7.9a

Commands
~~~~~~
- STAR
- STARlong

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load star/2.7.10a 

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run STAR on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=star
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers star/2.7.10a
    
    
    STAR  --runThreadN 24  --runMode genomeGenerate  --genomeDir ref_genome  --genomeFastaFiles ref_genome.fasta

    STAR --runThreadN 24 --genomeDir ref_genome --readFilesIn seq_1.fastq seq_2.fastq  --outSAMtype BAM SortedByCoordinate --outWigType wiggle read2
