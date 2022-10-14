.. _backbone-label:

Snpsift
==============================

Introduction
~~~~~~~~
``Snpsift`` is a tool used to annotate genomic variants using databases, filters, and manipulates genomic annotated variants. | For more information, please check its website: https://biocontainers.pro/tools/snpsift and its home page on `Github`_.

Versions
~~~~~~~~
- 4.3.1t

Commands
~~~~~~~
- SnpSift

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load snpsift

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Snpsift on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=snpsift
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers snpsift

    SnpSift annotate -id dbSnp132.vcf \
        variants.vcf > variants_annotated.vcf

.. _Github: http://pcingola.github.io/SnpEff/
