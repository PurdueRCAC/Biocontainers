.. _backbone-label:

Vg
==============================

Introduction
~~~~~~~~
Variation graphs (vg) provides tools for working with genome variation graphs.
| For more information, please check:
Quay.io: https://quay.io/repository/vgteam/vg?tabinfo 
| Home page: https://github.com/vgteam/vg

Versions
~~~~~~~~
- 1.40.0

Commands
~~~~~~~
- vg

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load vg

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run vg on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=vg
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers vg

    vg construct -r test/small/x.fa -v test/small/x.vcf.gz >x.vg

    # GFA output
    vg view x.vg >x.gfa

    # dot output suitable for graphviz
    vg view -d x.vg >x.dot

    # And if you have a GAM file
    cp small/x-s1337-n1.gam x.gam

    # json version of binary alignments
    vg view -a x.gam >x.json

    vg align -s CTACTGACAGCAGAAGTTTGCTGTGAAGATTAAATTAGGTGATGCTTG x.vg
