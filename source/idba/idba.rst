.. _backbone-label:

Idba
==============================

Introduction
~~~~~~~~
``Idba`` is a practical iterative De Bruijn Graph De Novo Assembler for sequence assembly in bioinfomatics. | For more information, please check its website: https://biocontainers.pro/tools/idba and its home page: https://i.cs.hku.hk/~alse/hkubrg/projects/idba/index.html.

Versions
~~~~~~~~
- 1.1.3

Commands
~~~~~~~
- fa2fq
- filter_blat
- filter_contigs
- filterfa
- fq2fa
- idba
- idba_hybrid
- idba_tran
- idba_tran_test
- idba_ud
- parallel_blat
- parallel_rna_blat
- print_graph
- raw_n50
- run-unittest.py
- sample_reads
- scaffold
- scan.py
- shuffle_reads
- sim_reads
- sim_reads_tran
- sort_psl
- sort_reads
- split_fa
- split_fq
- split_scaffold
- test
- validate_blat
- validate_blat_parallel
- validate_component
- validate_contigs_blat
- validate_contigs_mummer
- validate_reads_blat
- validate_rna

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load idba

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Idba on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=idba
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers idba

    fq2fa --paired --filter SRR1977249.abundtrim.subset.pe.fq SRR1977249.abundtrim.subset.pe.fa
    idba_ud  -r SRR1977249.abundtrim.subset.pe.fa -o output
