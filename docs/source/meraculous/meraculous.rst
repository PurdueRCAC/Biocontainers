.. _backbone-label:

Meraculous
==============================

Introduction
~~~~~~~~
Meraculous is a whole genome assembler for Next Generation Sequencing data, geared for large genomes. It is hybrid k-mer/read-based approach capitalizes on the high accuracy of Illumina sequence by eschewing an explicit error correction step which we argue to be redundant with the assembly process. Meraculous achieves high performance with large datasets by utilizing lightweight data structures and multi-threaded parallelization, allowing to assemble human-sized genomes on a high-cpu cluster in under a day. The process pipeline implements a highly transparent and portable model of job control and monitoring where different assembly stages can be executed and re-executed separately or in unison on a wide variety of architectures.


| For more information, please check:
| Home page: https://jgi.doe.gov/data-and-tools/software-tools/meraculous/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.2.6
  * - BELL
    - 2.2.6
  * - GAUTSCHI
    - 2.2.6
  * - NEGISHI
    - 2.2.6
  * - SCHOLAR
    - 2.2.6

Commands
~~~~~~~
- run_meraculous.sh
- blastMapAnalyzer2.pl
- bmaToLinks.pl
- _bubbleFinder2.pl
- bubblePopper.pl
- bubbleScout.pl
- contigBias.pl
- divide_it.pl
- fasta_splitter.pl
- findDMin2.pl
- gapDivider.pl
- gapPlacer.pl
- haplotyper.Naive.pl
- haplotyper.pl
- histogram2.pl
- kmerHistAnalyzer.pl
- loadBalanceMers.pl
- meraculous4h.pl
- meraculous.pl
- N50.pl
- _oNo4.pl
- oNo7.pl
- optimize2.pl
- randomList2.pl
- scaffold2contig.pl
- scaffReportToFasta.pl
- screen_list2.pl
- spanner.pl
- splinter.pl
- splinter_scaffolds.pl
- split_and_validate_reads.pl
- test_dependencies.pl
- unique.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load meraculous

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run meraculous on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=meraculous
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers meraculous
