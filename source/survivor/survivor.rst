.. _backbone-label:

Survivor
==============================

Introduction
~~~~~~~~
SURVIVOR is a tool set for simulating/evaluating SVs, merging and comparing SVs within and among samples, and includes various methods to reformat or summarize SVs.
|For more information, please check:
|BioContainers: https://biocontainers.pro/tools/survivor 
|Home page: https://github.com/fritzsedlazeck/SURVIVOR

Versions
~~~~~~~~
- 1.0.7

Commands
~~~~~~~
- SURVIVOR

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load survivor

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run survivor on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=survivor
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers survivor

    SURVIVOR simSV parameter_file
    SURVIVOR simSV ref.fa parameter_file 0.1 0 simulated
    SURVIVOR eval caller.vcf simulated.bed 10 eval_res
~                                                    
