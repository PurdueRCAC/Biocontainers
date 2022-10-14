.. _backbone-label:

Targetp
==============================

Introduction
~~~~~~~~
TargetP-2.0 tool predicts the presence of N-terminal presequences: signal peptide (SP), mitochondrial transit peptide (mTP), chloroplast transit peptide (cTP) or thylakoid luminal transit peptide (luTP). For the sequences predicted to contain an N-terminal presequence a potential cleavage site is also predicted.
|For more information, please check:
|Home page: https://services.healthtech.dtu.dk/service.php?TargetP-2.0

Versions
~~~~~~~~
- 2.0

Commands
~~~~~~~
- targetp

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load targetp

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run targetp on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=targetp
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers targetp
