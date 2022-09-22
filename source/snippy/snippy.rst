.. _backbone-label:

Snippy
==============================

Introduction
~~~~~~~~
``Snippy`` is a tool for rapid haploid variant calling and core genome alignment. For more information, please check its Docker hub: https://hub.docker.com/r/staphb/snippy and its home page on `Github`_.

Versions
~~~~~~~~
- 4.6.0

Commands
~~~~~~~
- snippy
- snippy-clean_full_aln
- snippy-core
- snippy-multi
- snippy-vcf_extract_subs
- snippy-vcf_report
- snippy-vcf_to_tab

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load snippy

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Snippy on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=snippy
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers snippy

.. _Github: https://github.com/tseemann/snippy
