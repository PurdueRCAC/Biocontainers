.. _backbone-label:

Bioawk
==============================

Introduction
~~~~~~~~
``Bioawk`` is an extension to Brian Kernighan's awk, adding the support of several common biological data formats, including optionally gzip'ed BED, GFF, SAM, VCF, FASTA/Q and TAB-delimited formats with column names. |For more information, please check its website: https://biocontainers.pro/tools/bioawk and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0

Commands
~~~~~~~
- bioawk

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bioawk

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bioawk on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bioawk
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bioawk

    bioawk -c fastx '{print ">"$name;print revcomp($seq)}' seq.fa.gz


.. _Github: https://github.com/lh3/bioawk
