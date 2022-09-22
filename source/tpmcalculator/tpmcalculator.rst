.. _backbone-label:  

TPMCalculator 
============================== 

Introduction
~~~~~~~
``TPMCalculator`` quantifies mRNA abundance directly from the alignments by parsing BAM files.

Detailed usage can be found here: https://github.com/ncbi/TPMCalculator


Versions
~~~~~~~~
- 0.0.3
- 0.0.4

Commands
~~~~~~
- TPMCalculator 

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load tpmcalculator

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run tpmcalculator on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=tpmcalculator
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers transdecoder
    
    TPMCalculator -g Homo_sapiens.GRCh38.105.chr.gtf -b SRR12095148Aligned.sortedByCoord.out.bam
