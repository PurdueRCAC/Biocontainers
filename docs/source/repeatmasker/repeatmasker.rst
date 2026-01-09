.. _backbone-label:

RepeatMasker
==============================

Introduction
~~~~~~~
``RepeatMakser`` is a program that screens DNA sequences for interspersed repeats and low complexity DNA sequences. 
Detailed usage can be found here: http://www.repeatmasker.org.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 4.1.2
  * - BELL
    - 4.1.2
  * - GAUTSCHI
    - 4.1.2
  * - NEGISHI
    - 4.1.2, 4.1.8, 4.1.9, 4.2.0
  * - SCHOLAR
    - 4.1.2

Commands
~~~~~~  
- RepeatMasker 

Database
~~~~~  
.. note::
    As of May 20, 2019 GIRI has rescinded the working agreement allowing the www.repeatmasker.org website to offer a repeatmasking service utilizing the RepBase RepeatMasker Edition library. As a result, repeatmasker can only offer masking using the open database Dfam, which starting in 3.0 includes consensus sequences in addition to profile hidden Markov models for many transposable element families. Users requiring RepBase will need to purchase a commercial or academic license from GIRI and run RepeatMasker localy.   
    
    In our cluster, we set up the Dfam relaese 3.5 (October 2021) that include 285,580 repetitive DNA families. 

Species name
~~~~  
.. note::
    Since v4.1.1, RepeatMakser has switched to the FamDB format for the Dfam database. Due to this change, RepeatMasker becomes more strict with regards to what is acceptable for the ``-species`` flag. The commonly used names such as "mammal" and "mouse" will not be accepted. To check for valid names, you can query the database using the python script ``famdb.py`` (https://github.com/Dfam-consortium/FamDB).   
    
    See ``famdb.py --help`` for usage information and below for an example the check the valid name for "mammal" using our copy of the Dfam database::   
   
    /depot/itap/datasets/Maker/RepeatMasker/Libraries/famdb.py -i /depot/itap/datasets/Maker/RepeatMasker/Libraries/Dfam.h5 names mammal


Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load repeatmasker/4.1.2

Example job
~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run RepeatMasker on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 2:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=repeatmsker
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers repeatmasker/4.1.2 
    
    RepeatMasker -pa 24 -species mammals genome.fasta

     
    

    
