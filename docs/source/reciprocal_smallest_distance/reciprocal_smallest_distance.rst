.. _backbone-label:

Reciprocal Smallest Distance
==============================

Introduction
~~~~~~~~
The ``reciprocal smallest distance`` (RSD) algorithm accurately infers orthologs between pairs of genomes by considering global sequence alignment and maximum likelihood evolutionary distance between sequences. 

| For more information, please check its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.1.7
  * - BELL
    - 1.1.7
  * - GAUTSCHI
    - 1.1.7
  * - NEGISHI
    - 1.1.7
  * - SCHOLAR
    - 1.1.7

Commands
~~~~~~~
- rsd_search
- rsd_blast
- rsd_format

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load reciprocal_smallest_distance

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Reciprocal Smallest Distance on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=reciprocal_smallest_distance
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers reciprocal_smallest_distance

    rsd_search 
        -q Mycoplasma_genitalium.aa \
        --subject-genome=Mycobacterium_leprae.aa \
        -o Mycoplasma_genitalium.aa_Mycobacterium_leprae.aa_0.8_1e-5.orthologs.txt

    rsd_format -g Mycoplasma_genitalium.aa

    rsd_blast -v -q Mycoplasma_genitalium.aa \
        --subject-genome=Mycobacterium_leprae.aa \
        --forward-hits q_s.hits --reverse-hits s_q.hits \
        --no-format --evalue 0.1
.. _Github:  https://github.com/todddeluca/reciprocal_smallest_distance
