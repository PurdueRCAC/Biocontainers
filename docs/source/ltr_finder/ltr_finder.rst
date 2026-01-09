.. _backbone-label:

Ltr_finder
==============================

Introduction
~~~~~~~~
LTR_Finder is an efficient program for finding full-length LTR retrotranspsons in genome sequences.


| For more information, please check:
| Home page: https://github.com/xzhub/LTR_Finder

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.07

Commands
~~~~~~~
- ltr_finder
- check_result.pl
- down_tRNA.pl
- filter_rt.pl
- genome_plot.pl
- genome_plot2.pl
- genome_plot_svg.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ltr_finder

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ltr_finder on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ltr_finder
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ltr_finder

