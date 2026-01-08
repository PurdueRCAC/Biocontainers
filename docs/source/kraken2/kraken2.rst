.. _backbone-label:  

Kraken2
============================== 

Introduction
~~~~~~~
``Kraken2`` is the newest version of Kraken, a taxonomic classification system using exact k-mer matches to achieve high accuracy and fast classification speeds. This classifier matches each k-mer within a query sequence to the lowest common ancestor (LCA) of all genomes containing the given k-mer. 

Detailed usage can be found here: https://ccb.jhu.edu/software/kraken2/


Versions
~~~~~~~~
- 2.1.2
- 2.1.2_fixftp
- 2.1.3-pl5321
- 2.1.3

Commands
~~~~~~
- kraken2
- kraken2-build
- kraken2-inspect

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load kraken2/2.1.2

Download database
~~~~~~~  
.. note::
    There is a known bug in ``rsync_from_ncbi.pl`` (https://github.com/DerrickWood/kraken2/issues/292). When users want to download and build databases by ``kraken2-build --download-library``, there will an error ``rsync_from_ncbi.pl: unexpected FTP path(new server?)``. We modifed ``rsync_from_ncbi.pl`` to fix the bug, and created a new module ending with the suffix ``_fixftp``. Please use this corrected module to download the library.
 
To download databases, please use the below command::

    module load biocontainers
    module load kraken2/2.1.2_fixftp
    
    kraken2-build --download-library archaea --db archaea


Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run kraken2 on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=kraken2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kraken2/2.1.2
    
    kraken2 --threads 24  --report kranken2.report --db minikraken2_v2_8GB_201904_UPDATE --paired --classified-out cseqs#.fq SRR5043021_1.fastq SRR5043021_2.fastq
