.. _backbone-label:  

BlobTools
============================== 

Introduction
~~~~~~~
``BlobTools`` is a modular command-line solution for visualisation, quality control and taxonomic partitioning of genome datasets.

Detailed usage can be found here: https://github.com/DRL/blobtools

Versions
~~~~~~~~
- 1.1.1

Commands
~~~~~~
- blobtools 

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load blobtools/1.1.1

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run blobtools on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=blobtools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers blobtools/1.1.1
    
    blobtools create -i example/assembly.fna -b example/mapping_1.sorted.bam -t example/blast.out -o test && \
    blobtools view -i test.blobDB.json && \
    blobtools plot -i test.blobDB.json
