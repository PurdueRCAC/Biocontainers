.. _backbone-label:

Samplot
==============================

Introduction
~~~~~~~~
``Samplot`` is a command line tool for rapid, multi-sample structural variant visualization. | For more information, please check its website: https://biocontainers.pro/tools/samplot and its home page on `Github`_.

Versions
~~~~~~~~
- 1.3.0

Commands
~~~~~~~
- samplot

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load samplot

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Samplot on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=samplot
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers samplot

    samplot plot \
    -n NA12878 NA12889 NA12890 \
    -b samplot/test/data/NA12878_restricted.bam \
      samplot/test/data/NA12889_restricted.bam \
      samplot/test/data/NA12890_restricted.bam \
    -o 4_115928726_115931880.png \
    -c chr4 \
    -s 115928726 \
    -e 115931880 \
    -t DEL

.. _Github: https://github.com/ryanlayer/samplot
