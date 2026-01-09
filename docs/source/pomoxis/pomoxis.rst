.. _backbone-label:

Pomoxis
==============================

Introduction
~~~~~~~~
Pomoxis comprises a set of basic bioinformatic tools tailored to nanopore sequencing. Notably tools are included for generating and analysing draft assemblies. Many of these tools are used by the research data analysis group at Oxford Nanopore Technologies.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/zeunas/pomoxis 
| Home page: https://github.com/nanoporetech/pomoxis

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.3.9

Commands
~~~~~~~
- assess_assembly
- catalogue_errors
- common_errors_from_bam
- coverage_from_bam
- coverage_from_fastx
- fast_convert
- find_indels
- intersect_assembly_errors
- long_fastx
- mini_align
- mini_assemble
- pomoxis_path
- qscores_from_summary
- ref_seqs_from_bam
- reverse_bed
- split_fastx
- stats_from_bam
- subsample_bam
- summary_from_stats
- tag_bam
- trim_alignments

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pomoxis

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pomoxis on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pomoxis
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pomoxis

