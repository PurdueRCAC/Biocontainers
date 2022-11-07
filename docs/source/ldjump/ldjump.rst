.. _backbone-label:

Ldjump
==============================

Introduction
~~~~~~~~
LDJump is an R package to estimate variable recombination rates from population genetic data.


| For more information, please check:
| Home page: https://github.com/PhHermann/LDJump

Versions
~~~~~~~~
- 0.3.1

Commands
~~~~~~~
- R
- Rscript

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ldjump

.. note::

   A full path to the Phi file of PhiPack needs to be provided as follows ``pathPhi = "/opt/PhiPack/Phi"``. In order to use LDhat to quickly calculate some of the summary statistics, please set ``pathLDhat = "/opt/LDhat/"``.
 
Interactive job
~~~~~
To run interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers ldjump
   (base) UserID@bell-a008:~ $ R
   
   R version 4.2.1 (2022-06-23) -- "Funny-Looking Kid"
   Copyright (C) 2022 The R Foundation for Statistical Computing
   Platform: x86_64-pc-linux-gnu (64-bit)

   R is free software and comes with ABSOLUTELY NO WARRANTY.
   You are welcome to redistribute it under certain conditions.
   Type 'license()' or 'licence()' for distribution details.

   Natural language support but running in an English locale

   R is a collaborative project with many contributors.
   Type 'contributors()' for more information and
   'citation()' on how to cite R or R packages in publications.

   Type 'demo()' for some demos, 'help()' for on-line help, or
   'help.start()' for an HTML browser interface to help.
   Type 'q()' to quit R.
   

   > library(LDJump)
   > LDJump(seqFullPath, alpha = 0.05, segLength = 1000, pathLDhat = "/opt/LDhat/", pathPhi = "/opt/PhiPack/Phi", format = "fasta", refName = NULL, 
      start = NULL, constant = F, status = T, cores = 1, accept = F, demography = F, out = "")


Batch job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ldjump on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ldjump
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ldjump
    Rscript script.R
