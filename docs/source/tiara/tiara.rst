.. _backbone-label:

Tiara
==============================

Introduction
~~~~~~~~
``Tiara`` is a deep-learning-based approach for identification of eukaryotic sequences in the metagenomic data powered by PyTorch. 

| For more information, please check its | Docker hub: https://hub.docker.com/r/zhan4429/tiara and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.0.2
  * - BELL
    - 1.0.2
  * - GAUTSCHI
    - 1.0.2
  * - NEGISHI
    - 1.0.2
  * - SCHOLAR
    - 1.0.2

Commands
~~~~~~~
- tiara

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load tiara

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Tiara on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=tiara
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers tiara

    tiara -t 24 -i archaea_fr.fasta -o archaea_out.txt
    tiara -t 24 -i bacteria_fr.fasta -o bacteria_out.txt
    tiara -t 24 -i eukarya_fr.fasta -o eukarya_out.txt
    tiara -t 24 -i mitochondria_fr.fasta -o mitochondria_out.txt
    tiara -t 24  -i plast_fr.fasta -o plast_out.txt
    tiara -t 24  -i total.fasta -o mix_out.txt  --tf all  -p 0.65 0.60 --probabilities 
.. _Github: https://github.com/ibe-uw/tiara
