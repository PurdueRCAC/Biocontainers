.. _backbone-label:  

rmats2sashimiplot
============================== 

Introduction
~~~~~~~
``rmats2sashimiplot`` produces a sashimiplot visualization of rMATS output. rmats2sashimiplot can also produce plots using an annotation file and genomic coordinates. The plotting backend is MISO.  

Detailed usage can be found here: https://github.com/Xinglab/rmats2sashimiplot


Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.0.4
  * - BELL
    - 2.0.4
  * - GAUTSCHI
    - 2.0.4
  * - NEGISHI
    - 2.0.4
  * - SCHOLAR
    - 2.0.4

Commands
~~~~~~
- rmats2sashimiplot

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load rmats2sashimiplot

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rmats on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=rmats2sashimiplot
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rmats2sashimiplot
    
    rmats2sashimiplot --s1 sample_1_replicate_1.sam,sample_1_replicate_2.sam,sample_1_replicate_3.sam \
                      --s2 sample_2_replicate_1.sam,sample_2_replicate_2.sam,sample_2_replicate_3.sam \
                      -t SE -e SE.MATS.JC.txt --l1 SampleOne --l2 SampleTwo --exon_s 1 --intron_s 5 \
                      -o test_events_output
