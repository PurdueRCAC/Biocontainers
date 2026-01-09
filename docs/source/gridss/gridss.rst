.. _backbone-label:

Gridss
==============================

Introduction
~~~~~~~~
Gridss is a module software suite containing tools useful for the detection of genomic rearrangements.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/gridss/gridss 
| Home page: https://github.com/PapenfussLab/gridss

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.13.2

Commands
~~~~~~~
- R
- Rscript
- gridss
- gridss_annotate_vcf_kraken2
- gridss_annotate_vcf_repeatmasker
- gridss_extract_overlapping_fragments
- gridss_somatic_filter
- gridsstools
- virusbreakend
- virusbreakend-build

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gridss

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gridss on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gridss
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gridss

