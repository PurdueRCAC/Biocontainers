.. _backbone-label:

Gmap
==============================

Introduction
~~~~~~~~
``Gmap`` is a genomic mapping and alignment program for mRNA and EST sequences. 

| For more information, please check its website: https://biocontainers.pro/tools/gmap and its home page: http://research-pub.gene.com/gmap/.

Versions
~~~~~~~~
- 2021.05.27
- 2021.08.25

Commands
~~~~~~~
- atoiindex
- cmetindex
- cpuid
- dbsnp_iit
- ensembl_genes
- fa_coords
- get-genome
- gff3_genes
- gff3_introns
- gff3_splicesites
- gmap
- gmap.avx2
- gmap_build
- gmap_cat
- gmapindex
- gmapl
- gmapl.avx2
- gmapl.nosimd
- gmap.nosimd
- gmap_process
- gsnap
- gsnap.avx2
- gsnapl
- gsnapl.avx2
- gsnapl.nosimd
- gsnap.nosimd
- gtf_genes
- gtf_introns
- gtf_splicesites
- gtf_transcript_splicesites
- gvf_iit
- iit_dump
- iit_get
- iit_store
- indexdb_cat
- md_coords
- psl_genes
- psl_introns
- psl_splicesites
- sam_sort
- snpindex
- trindex
- vcf_iit

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load gmap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Gmap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=gmap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gmap

    gmap_build -d Cmm -D Cmm genome.fasta
    gmap -d Cmm -t 4 -D ./Cmm  cdna.fasta > gmap_out.txt

    gmap_build -d GRCh38 -D GRCh38 Homo_sapiens.GRCh38.dna.primary_assembly.fa
    gsnap -d GRCh38 -D ./GRCh38 --nthreads=4  SRR16956239_1.fastq SRR16956239_2.fastq > gsnap_out.txt
