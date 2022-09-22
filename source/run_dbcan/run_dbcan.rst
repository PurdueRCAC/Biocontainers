.. _backbone-label:  
run-dbCAN
============================== 

Introduction
~~~~~~~
``run_dbCAN`` using genomes/metagenomes/proteomes of any assembled organisms (prokaryotes, fungi, plants, animals, viruses) to search for CAZymes. This is a  standalone tool of http://bcb.unl.edu/dbCAN2/. Details aobut its uage can be found in its  `Github`_ repository. 

Versions
~~~~~~~~
- 3.0.2

Commands
~~~~~ 
run_dbcan

Database
~~~~~~
Latest version of database has been downloaded and setup, including CAZyDB.09242021.fa, dbCAN-HMMdb-V10.txt, tcdb.fa, tf-1.hmm, tf-2.hmm, and stp.hmm.  

Module
~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load run_dbcan/3.0.2

Example job
~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run run_dbcan on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=run_dbcan
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers run_dbcan/3.0.2
    
    run_dbcan protein.faa protein --out_dir test1_dbcan
    run_dbcan genome.fasta prok --out_dir test2_dbcan



.. _Github: https://github.com/linnabrown/run_dbcan
