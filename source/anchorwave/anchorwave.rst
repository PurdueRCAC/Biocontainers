.. _backbone-label:

Anchorwave
==============================

Introduction
~~~~~~~~
``Anchorwave`` is used for sensitive alignment of genomes with high sequence diversity, extensive structural polymorphism and whole-genome duplication variation. 
| For more information, please check its website: https://biocontainers.pro/tools/anchorwave and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0.1

Commands
~~~~~~~
- anchorwave
- gmap_build
- gmap
- minimap2

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load anchorwave

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Anchorwave on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=anchorwave
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers anchorwave

    anchorwave gff2seq -i Zea_mays.AGPv4.34.gff3 -r Zea_mays.AGPv4.dna.toplevel.fa -o cds.fa

.. _Github: https://github.com/baoxingsong/AnchorWave

