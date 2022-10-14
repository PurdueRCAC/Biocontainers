.. _backbone-label:

fastStructure
==============================

Introduction
~~~~~~~~
``fastStructure`` is an algorithm for inferring population structure from large SNP genotype data. It is based on a variational Bayesian framework for posterior inference and is written in Python2.x.

Note: programs "structure.py", "chooseK.py" and "distruct.py" are standalone executable and should be called by name directly ("structure.py", etc). DO NOT invoke them as "python structure.py", or as "python /usr/local/bin/structure.py", this will not work!

Note: This containers lacks X11 libraries, so GUI plots with 'distruct.py' do not work.  Instead, we need to tell the underlying Matplotlib to use a non-interactive plotting backend (to file).  The easiest and most flexible way is to use the MPLBACKEND environment variable: env MPLBACKEND="svg" distruct.py --output myplot.svg .......

Available backends in this container:
    Backend  Filetypes   Description
    agg      png         raster graphics – high quality PNG output
    ps       ps eps      vector graphics – Postscript output
    pdf      pdf         vector graphics – Portable Document Format
    svg      svg         vector graphics – Scalable Vector Graphics
Default MPLBACKEND="agg" (for PNG format output).

|For more information, please check its website: https://biocontainers.pro/tools/faststructure and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0-py27

Commands
~~~~~~~
- structure.py
- chooseK.py
- distruct.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load faststructure

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run fastStructure on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=faststructure
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers faststructure

.. _Github: https://rajanil.github.io/fastStructure/
