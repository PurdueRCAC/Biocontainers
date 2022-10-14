.. _backbone-label:

Delly
==============================

Introduction
~~~~~~~~
``Delly`` is an integrated structural variant (SV) prediction method that can discover, genotype and visualize deletions, tandem duplications, inversions and translocations at single-nucleotide resolution in short-read massively parallel sequencing data. | For more information, please check its website: https://biocontainers.pro/tools/delly and its home page on `Github`_.

Versions
~~~~~~~~
- 0.9.1
- 1.0.3
- 1.1.3
- 1.1.5

Commands
~~~~~~~
- delly

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load delly

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Delly on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=delly
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers delly

    delly call -x hg19.excl -o delly.bcf -g hg19.fa input.bam
    delly filter -f somatic -o t1.pre.bcf -s samples.tsv t1.bcf

.. _Github: https://github.com/dellytools/delly
