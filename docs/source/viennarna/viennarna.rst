.. _backbone-label:

Viennarna
==============================

Introduction
~~~~~~~~
``Viennarna`` is a set of standalone programs and libraries used for prediction and analysis of RNA secondary structures. 

| For more information, please check its website: https://biocontainers.pro/tools/viennarna and its home page: https://www.tbi.univie.ac.at/RNA/.

Versions
~~~~~~~~
- 2.5.0

Commands
~~~~~~~
- RNA2Dfold
- RNALalifold
- RNALfold
- RNAPKplex
- RNAaliduplex
- RNAalifold
- RNAcofold
- RNAdistance
- RNAdos
- RNAduplex
- RNAeval
- RNAfold
- RNAforester
- RNAheat
- RNAinverse
- RNAlocmin
- RNAmultifold
- RNApaln
- RNAparconv
- RNApdist
- RNAplex
- RNAplfold
- RNAplot
- RNApvmin
- RNAsnoop
- RNAsubopt
- RNAup
- Kinfold
- b2ct
- popt

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load viennarna

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Viennarna on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=viennarna
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers viennarna

    RNAfold < test.seq
    RNAfold -p --MEA < test.seq
