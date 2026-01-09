.. _backbone-label:

Vardict-java
==============================

Introduction
~~~~~~~~
VarDictJava is a variant discovery program written in Java and Perl. It is a Java port of VarDict variant caller.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/hydragenetics/vardict 
| Home page: https://github.com/AstraZeneca-NGS/VarDictJava

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.8.3

Commands
~~~~~~~
- vardict-java
- var2vcf_paired.pl
- var2vcf_valid.pl
- testsomatic.R
- teststrandbias.R

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load vardict-java

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run vardict-java on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=vardict-java
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers vardict-java

