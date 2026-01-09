.. _backbone-label:

Hap.py
==============================

Introduction
~~~~~~~~
Hap.py is a tool to compare diploid genotypes at haplotype level.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/pkrusche/hap.py 
| Home page: https://github.com/Illumina/hap.py

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.3.9
  * - BELL
    - 0.3.9
  * - GAUTSCHI
    - 0.3.9
  * - NEGISHI
    - 0.3.9
  * - SCHOLAR
    - 0.3.9

Commands
~~~~~~~
- bamstats.py
- cnx.py
- ftx.py
- guess-ploidy.py
- hap.py
- ovc.py
- plot-roh.py
- pre.py
- qfy.py
- som.py
- varfilter.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load hap.py

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run hap.py on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=hap.py
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers hap.py

    hap.py  \
      example/happy/PG_NA12878_chr21.vcf.gz \
      example/happy/NA12878_chr21.vcf.gz \
      -f example/happy/PG_Conf_chr21.bed.gz \
      -r example/chr21.fa \
      -o test
