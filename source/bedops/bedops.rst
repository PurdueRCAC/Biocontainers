.. _backbone-label:

Bedops
==============================

Introduction
~~~~~~~~
``Bedops`` is a software package for manipulating and analyzing genomic interval data. 

| For more information, please check its website: https://biocontainers.pro/tools/bedops and its home page: https://bedops.readthedocs.io/en/latest/.

Versions
~~~~~~~~
- 2.4.39

Commands
~~~~~~~
- bam2bed
- bam2bed-float128
- bam2bed_gnuParallel
- bam2bed_gnuParallel-float128
- bam2bed_gnuParallel-megarow
- bam2bed_gnuParallel-typical
- bam2bed-megarow
- bam2bed_sge
- bam2bed_sge-float128
- bam2bed_sge-megarow
- bam2bed_sge-typical
- bam2bed_slurm
- bam2bed_slurm-float128
- bam2bed_slurm-megarow
- bam2bed_slurm-typical
- bam2bed-typical
- bam2starch
- bam2starch-float128
- bam2starch_gnuParallel
- bam2starch_gnuParallel-float128
- bam2starch_gnuParallel-megarow
- bam2starch_gnuParallel-typical
- bam2starch-megarow
- bam2starch_sge
- bam2starch_sge-float128
- bam2starch_sge-megarow
- bam2starch_sge-typical
- bam2starch_slurm
- bam2starch_slurm-float128
- bam2starch_slurm-megarow
- bam2starch_slurm-typical
- bam2starch-typical
- bedextract
- bedextract-float128
- bedextract-megarow
- bedextract-typical
- bedmap
- bedmap-float128
- bedmap-megarow
- bedmap-typical
- bedops
- bedops-float128
- bedops-megarow
- bedops-typical
- closest-features
- closest-features-float128
- closest-features-megarow
- closest-features-typical
- convert2bed
- convert2bed-float128
- convert2bed-megarow
- convert2bed-typical
- gff2bed
- gff2bed-float128
- gff2bed-megarow
- gff2bed-typical
- gff2starch
- gff2starch-float128
- gff2starch-megarow
- gff2starch-typical
- gtf2bed
- gtf2bed-float128
- gtf2bed-megarow
- gtf2bed-typical
- gtf2starch
- gtf2starch-float128
- gtf2starch-megarow
- gtf2starch-typical
- gvf2bed
- gvf2bed-float128
- gvf2bed-megarow
- gvf2bed-typical
- gvf2starch
- gvf2starch-float128
- gvf2starch-megarow
- gvf2starch-typical
- psl2bed
- psl2bed-float128
- psl2bed-megarow
- psl2bed-typical
- psl2starch
- psl2starch-float128
- psl2starch-megarow
- psl2starch-typical
- rmsk2bed
- rmsk2bed-float128
- rmsk2bed-megarow
- rmsk2bed-typical
- rmsk2starch
- rmsk2starch-float128
- rmsk2starch-megarow
- rmsk2starch-typical
- sam2bed
- sam2bed-float128
- sam2bed-megarow
- sam2bed-typical
- sam2starch
- sam2starch-float128
- sam2starch-megarow
- sam2starch-typical
- sort-bed
- sort-bed-float128
- sort-bed-megarow
- sort-bed-typical
- starch
- starchcat
- starchcat-float128
- starchcat-megarow
- starchcat-typical
- starchcluster_gnuParallel
- starchcluster_gnuParallel-float128
- starchcluster_gnuParallel-megarow
- starchcluster_gnuParallel-typical
- starchcluster_sge
- starchcluster_sge-float128
- starchcluster_sge-megarow
- starchcluster_sge-typical
- starchcluster_slurm
- starchcluster_slurm-float128
- starchcluster_slurm-megarow
- starchcluster_slurm-typical
- starch-diff
- starch-diff-float128
- starch-diff-megarow
- starch-diff-typical
- starch-float128
- starch-megarow
- starchstrip
- starchstrip-float128
- starchstrip-megarow
- starchstrip-typical
- starch-typical
- switch-BEDOPS-binary-type
- unstarch
- unstarch-float128
- unstarch-megarow
- unstarch-typical
- update-sort-bed-migrate-candidates
- update-sort-bed-migrate-candidates-float128
- update-sort-bed-migrate-candidates-megarow
- update-sort-bed-migrate-candidates-typical
- update-sort-bed-slurm
- update-sort-bed-slurm-float128
- update-sort-bed-slurm-megarow
- update-sort-bed-slurm-typical
- update-sort-bed-starch-slurm
- update-sort-bed-starch-slurm-float128
- update-sort-bed-starch-slurm-megarow
- update-sort-bed-starch-slurm-typical
- vcf2bed
- vcf2bed-float128
- vcf2bed-megarow
- vcf2bed-typical
- vcf2starch
- vcf2starch-float128
- vcf2starch-megarow
- vcf2starch-typical
- wig2bed
- wig2bed-float128
- wig2bed-megarow
- wig2bed-typical
- wig2starch
- wig2starch-float128
- wig2starch-megarow
- wig2starch-typical

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bedops

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bedops on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bedops
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bedops

    bedops -m 001.merge.001.test > 001.merge.001.observed
    bedops -c 001.merge.001.test > 001.complement.001.observed
    bedops -i 001.intersection.001a.test 001.intersection.001b.test > 001.intersection.001.observed
