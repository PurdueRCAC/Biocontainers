.. _backbone-label:

Signalp6
==============================

Introduction
~~~~~~~~
SignalP predicts the presence and location of signal peptide cleavage sites in amino acid sequences from different organisms: Gram-positive prokaryotes, Gram-negative prokaryotes, and eukaryotes.

| For more information, please check:
| Home page: https://services.healthtech.dtu.dk/service.php?SignalP

Versions
~~~~~~~~
- 6.0-fast
- 6.0-slow

Commands
~~~~~~~
- signalp6

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load signalp6

Example job for fast mode
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run signalp6 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 2:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=signalp6-fast
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers signalp6/6.0-fast

    signalp6 --write_procs 24 --fastafile proteins_clean.fasta  \
        --organism euk --output_dir output_fast  \
        --format txt --mode fast


Example job for slow mode
~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run signalp6 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 12:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=signalp6-slow
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers signalp6/6.0-slow

    signalp6 --write_procs 24 --fastafile proteins_clean.fasta  \
        --organism euk --output_dir output_slow  \
        --format txt --mode slow
   
    signalp6 --write_procs 24 --fastafile proteins_clean.fasta  \
        --organism euk --output_dir output_slow-sequential  \
        --format txt --mode slow-sequential
