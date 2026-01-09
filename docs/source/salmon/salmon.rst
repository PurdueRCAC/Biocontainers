.. _backbone-label:  

Salmon
============================== 

Introduction
~~~~~~~
``Salmon`` is a wicked-fast program to produce a highly-accurate, transcript-level quantification estimates from RNA-seq data. 

Detailed usage can be found here: https://github.com/COMBINE-lab/salmon


Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.5.2, 1.6.0, 1.7.0, 1.8.0, 1.9.0, 1.10.1
  * - BELL
    - 1.5.2, 1.6.0, 1.7.0, 1.8.0, 1.9.0, 1.10.1
  * - GAUTSCHI
    - 1.5.2, 1.6.0, 1.7.0, 1.8.0, 1.9.0, 1.10.1
  * - NEGISHI
    - 1.5.2, 1.6.0, 1.7.0, 1.8.0, 1.9.0, 1.10.1
  * - SCHOLAR
    - 1.5.2, 1.6.0, 1.7.0, 1.8.0, 1.9.0, 1.10.1

Commands
~~~~~~
- salmon index 
- salmon quant
- salmon alevin
- salmon swim
- salmon quantmerge

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load salmon

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Salmon on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=salmon
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers salmon
    
    salmon index -t  Homo_sapiens.GRCh38.cds.all.fa -i salmon_index
    salmon quant -i salmon_index -l A -p 24 -1 SRR16956239_1.fastq -2 SRR16956239_2.fastq --validateMappings -o transcripts_quan
