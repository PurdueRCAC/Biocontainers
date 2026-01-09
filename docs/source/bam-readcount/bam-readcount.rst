.. _backbone-label:

Bam-readcount
==============================

Introduction
~~~~~~~~
``Bam-readcount`` is a utility that runs on a BAM or CRAM file and generates low-level information about sequencing data at specific nucleotide positions. 

| For more information, please check its | Docker hub: https://hub.docker.com/r/mgibio/bam-readcount and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.0.0
  * - BELL
    - 1.0.0
  * - GAUTSCHI
    - 1.0.0
  * - NEGISHI
    - 1.0.0
  * - SCHOLAR
    - 1.0.0

Commands
~~~~~~~
- bam-readcount

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bam-readcount

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bam-readcount on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bam-readcount
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bam-readcount

    bam-readcount -f Homo_sapiens.GRCh38.dna.primary_assembly.fa Aligned.sortedByCoord.out.bam 

.. _Github: https://github.com/genome/bam-readcount

