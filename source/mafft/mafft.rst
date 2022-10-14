.. _backbone-label:

MAFFT
==============================

Introduction
~~~~~~~~
``MAFFT`` is a multiple alignment program for amino acid or nucleotide sequences. 

| For more information, please check its website: https://biocontainers.pro/tools/mafft and its home page: https://mafft.cbrc.jp/alignment/software/.

Versions
~~~~~~~~
- 7.475
- 7.490

Commands
~~~~~~~
- einsi
- fftns
- fftnsi
- ginsi
- linsi
- mafft
- mafft-distance
- mafft-einsi
- mafft-fftns
- mafft-fftnsi
- mafft-ginsi
- mafft-homologs.rb
- mafft-linsi
- mafft-nwns
- mafft-nwnsi
- mafft-profile
- mafft-qinsi
- mafft-sparsecore.rb
- mafft-xinsi
- nwns
- nwnsi

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load mafft

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run MAFFT on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mafft
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mafft
