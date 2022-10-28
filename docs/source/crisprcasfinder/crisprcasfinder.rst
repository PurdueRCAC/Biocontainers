.. _backbone-label:  

CRISPRCasFinder 
============================== 

Introduction
~~~~~~~
``CRISPRCasFinder`` enables the easy detection of CRISPRs and cas genes in user-submitted sequence data. It is an updated, improved, and integrated version of CRISPRFinder and CasFinder.   

Detailed usage can be found here: https://github.com/dcouvin/CRISPRCasFinder

Versions
~~~~~~~~
- 4.2.20

Commands
~~~~~~
- CRISPRCasFinder.pl  

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load crisprcasfinder/4.2.20 

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run CRISPRCasFinder on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 2:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=CRISPRCasFinder
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers crisprcasfinder/4.2.20 
    
    CRISPRCasFinder.pl -in install_test/sequence.fasta -cas -cf CasFinder-2.0.3 -def G -keep
