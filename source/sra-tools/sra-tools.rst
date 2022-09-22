.. _backbone-label:  
SRA-Toolkit
============================== 

Introduction
~~~~~~~
``SRA-Toolkit``  is a collection of tools and libraries for using data in the INSDC Sequence Read Archives. Its detailed documentation can be found in https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc. 

Versions
~~~~~~~~
- 2.11.0-pl5262

Commands
~~~~~ 
- abi-dump
- align-cache
- align-info
- bam-load
- cache-mgr
- cg-load
- fasterq-dump
- fasterq-dump-orig
- fastq-dump
- fastq-dump-orig
- illumina-dump
- kar
- kdbmeta
- kget
- latf-load
- md5cp
- prefetch
- prefetch-orig
- rcexplain
- read-filter-redact
- sam-dump
- sam-dump-orig
- sff-dump
- sra-pileup
- sra-pileup-orig
- sra-sort
- sra-sort-cg
- sra-stat
- srapath
- srapath-orig
- sratools
- test-sra
- vdb-config
- vdb-copy
- vdb-diff
- vdb-dump
- vdb-encrypt
- vdb-lock
- vdb-passwd
- vdb-unlock
- vdb-validate

Module
~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load sra-tools/2.11.0-pl5262

Configuring SRA-Toolkit
~~~~~~
Users can config SRA-Toolkit by the command ``vdb-config``. For example, the below command set up the current working directory for downloading::
    
   vdb-config --prefetch-to-cwd
  
Example job
~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run SRA-Toolkit on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=SRA-Toolkit
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers sra-tools/2.11.0-pl5262
    
    vdb-config --prefetch-to-cwd # The data will be downloaded to the current working directory.  
    prefetch SRR11941281
    fastq-dump --split-3 SRR11941281/SRR11941281.sra --threads 8
