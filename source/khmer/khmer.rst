.. _backbone-label:

Khmer
==============================

Introduction
~~~~~~~~
``Khmer`` is a tool for k-mer counting, filtering, and graph traversal FTW! 

| For more information, please check its website: https://biocontainers.pro/tools/khmer and its home page on `Github`_.

Versions
~~~~~~~~
- 3.0.0a3-py36

Commands
~~~~~~~
- abundance-dist.py
- abundance-dist-single.py
- annotate-partitions.py
- count-median.py
- cygdb
- cython
- cythonize
- do-partition.py
- extract-long-sequences.py
- extract-paired-reads.py
- extract-partitions.py
- fastq-to-fasta.py
- filter-abund.py
- filter-abund-single.py
- filter-stoptags.py
- find-knots.py
- interleave-reads.py
- load-graph.py
- load-into-counting.py
- make-initial-stoptags.py
- merge-partitions.py
- normalize-by-median.py
- partition-graph.py
- readstats.py
- sample-reads-randomly.py
- screed
- split-paired-reads.py
- trim-low-abund.py
- unique-kmers.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load khmer

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Khmer on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=khmer
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers khmer

.. _Github: https://github.com/dib-lab/khmer
