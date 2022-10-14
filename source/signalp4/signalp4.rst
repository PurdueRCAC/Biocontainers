.. _backbone-label:

SignalP
==============================

Introduction
~~~~~~~~
``SignalP`` predicts the presence and location of signal peptide cleavage sites in amino acid sequences from different organisms: Gram-positive prokaryotes, Gram-negative prokaryotes, and eukaryotes. 
| For more information, please check its home page: https://services.healthtech.dtu.dk/service.php?SignalP-4.1.

Versions
~~~~~~~~
- 4.1

Commands
~~~~~~~
- signalp

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load signalp

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run SignalP on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=signalp
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers signalp

    signalp -t gram+ -f all proka.fasta > proka_out
    signalp -t euk -f all euk.fasta > euk.out
