.. _backbone-label:

Vcf2maf
==============================

Introduction
~~~~~~~~
To convert a VCF into a MAF, each variant must be mapped to only one of all possible gene transcripts/isoforms that it might affect. This selection of a single effect per variant, is often subjective. So this project is an attempt to make the selection criteria smarter, reproducible, and more configurable. And the default criteria must lean towards best practices.


| For more information, please check:
| Home page: https://github.com/mskcc/vcf2maf

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.6.21

Commands
~~~~~~~
- maf2maf.pl
- maf2vcf.pl
- vcf2maf.pl
- vcf2vcf.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load vcf2maf

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run vcf2maf on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=vcf2maf
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers vcf2maf

