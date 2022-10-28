.. _backbone-label:  

KrakenTools
============================== 

Introduction
~~~~~~~
``KrakenTools`` provides individual scripts to analyze Kraken/Kraken2/Bracken/KrakenUniq output files. 

Detailed usage can be found here: https://github.com/jenniferlu717/KrakenTools


Versions
~~~~~~~~
- 1.2

Commands
~~~~~~
- alpha_diversity.py
- beta_diversity.py
- combine_kreports.py
- combine_mpa.py
- extract_kraken_reads.py
- filter_bracken.out.py
- fix_unmapped.py
- kreport2krona.py
- kreport2mpa.py
- make_kreport.py
- make_ktaxonomy.py


Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load krakentools/1.2

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run krakentools on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=krakentools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers krakentools/1.2
    
    extract_kraken_reads.py -k myfile.kraken -t 2 -s1 SRR5043021_1.fastq -s2 SRR5043021_2.fastq -o extracted1.fq -o2 extracted2.fq
