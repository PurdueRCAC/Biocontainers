.. _backbone-label:

Lyveset
==============================

Introduction
~~~~~~~~
Lyveset is a method of using hqSNPs to create a phylogeny, especially for outbreak investigations.

| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/lyveset 
| Home page: https://github.com/lskatz/lyve-SET

Versions
~~~~~~~~
- 2.0.1

Commands
~~~~~~~
- applyFstToTree.pl
- cladeDistancesFromTree.pl
- clusterPairwise.pl
- convertAlignment.pl
- downloadDataset.pl
- errorProneRegions.pl
- filterMatrix.pl
- filterVcf.pl
- genomeDist.pl
- launch_bwa.pl
- launch_set.pl
- launch_smalt.pl
- launch_snap.pl
- launch_snpeff.pl
- launch_varscan.pl
- makeRegions.pl
- matrixToAlignment.pl
- pairwiseDistances.pl
- pairwiseTo2d.pl
- removeUninformativeSites.pl
- removeUninformativeSitesFromMatrix.pl
- run_assembly_isFastqPE.pl
- run_assembly_metrics.pl
- run_assembly_readMetrics.pl
- run_assembly_removeDuplicateReads.pl
- run_assembly_shuffleReads.pl
- run_assembly_trimClean.pl
- set_bayesHammer.pl
- set_diagnose.pl
- set_diagnose_msa.pl
- set_downloadTestData.pl
- set_findCliffs.pl
- set_findPhages.pl
- set_indexCase.pl
- set_manage.pl
- set_processPooledVcf.pl
- set_samtools_depth.pl
- set_test.pl
- shuffleSplitReads.pl
- snpDistribution.pl
- vcfToAlignment.pl
- vcfutils.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load lyveset

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run lyveset on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=lyveset
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers lyveset

    set_test.pl lambda
    set_manage.pl --create setTest
