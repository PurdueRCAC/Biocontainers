.. _backbone-label:

Biopython
==============================

Introduction
~~~~~~~~
``Biopython`` is a set of freely available tools for biological computation written in Python. 
| For more information, please check its website: https://biocontainers.pro/tools/biopython and its home page: https://biopython.org.

Versions
~~~~~~~~
- 1.70-np112py27
- 1.70-np112py36
- 1.78

Commands
~~~~~~~
- easy_install
- f2py
- f2py3
- idle3
- pip
- pip3
- pydoc
- pydoc3
- python
- python3
- python3-config
- python3.9
- python3.9-config
- wheel

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load biopython

Interactive job
~~~~~
To run biopython interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers biopython
   (base) UserID@bell-a008:~ $ python
   Python 3.9.1 |  packaged by conda-forge |  (default, Jan 26 2021, 01:34:10) 
   [GCC 9.3.0] on linux
   Type "help", "copyright", "credits" or "license" for more information.
   >>> from Bio import SeqIO
   >>> with open("input.gb") as input_handle:
       for record in SeqIO.parse(input_handle, "genbank"):
             print(record)
        
Batch job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Biopython on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=biopython
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers biopython

    python script.py
