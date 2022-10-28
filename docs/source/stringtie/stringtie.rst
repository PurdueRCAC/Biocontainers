.. _backbone-label:  

StringTie
============================== 

Introduction
~~~~~~~
``StringTie``: efficient transcript assembly and quantitation of RNA-Seq data.  

Stringtie employs efficient algorithms for transcript structure recovery and abundance estimation from bulk RNA-Seq reads aligned to a reference genome. It takes as input spliced alignments in coordinate-sorted SAM/BAM/CRAM format and produces a GTF output which consists of assembled transcript structures and their estimated expression levels (FPKM/TPM and base coverage values).  

Detailed usage can be found here: https://github.com/gpertea/stringtie

Versions
~~~~~~~~
- 2.1.7
- 2.2.1

Commands
~~~~~~
- stringtie

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load stringtie

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run stringtie on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=stringtie
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers stringtie
    
    stringtie -o SRR11614710.gtf -G Homo_sapiens.GRCh38.105.gtf SRR11614710Aligned.sortedByCoord.out.bam    
    
