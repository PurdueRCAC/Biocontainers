.. _backbone-label:

Jcvi
==============================

Introduction
~~~~~~~~
Jcvi is a collection of Python libraries to parse bioinformatics files, or perform computation related to assembly, annotation, and comparative genomics.


| For more information, please check:
| Home page: https://github.com/tanghaibao/jcvi

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.2.7, 1.3.1
  * - BELL
    - 1.2.7, 1.3.1
  * - GAUTSCHI
    - 1.2.7, 1.3.1
  * - NEGISHI
    - 1.2.7, 1.3.1
  * - SCHOLAR
    - 1.2.7, 1.3.1

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load jcvi

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run jcvi on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=jcvi
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers jcvi

    python -m jcvi.formats.fasta format Vvinifera_145_Genoscope.12X.cds.fa.gz grape.cds
    python -m jcvi.formats.fasta format Ppersica_298_v2.1.cds.fa.gz peach.cds
    python -m jcvi.formats.gff bed --type=mRNA --key=Name --primary_only Vvinifera_145_Genoscope.12X.gene.gff3.gz -o grape.bed
    python -m jcvi.compara.catalog ortholog grape peach --no_strip_names
    python -m jcvi.graphics.dotplot grape.peach.anchors
    rm grape.peach.last.filtered 
    python -m jcvi.compara.catalog ortholog grape peach --cscore=.99 --no_strip_names
    python -m jcvi.graphics.dotplot grape.peach.anchors
    python -m jcvi.compara.synteny depth --histogram grape.peach.anchors
    python -m jcvi.graphics.grabseeds seeds test-data/test.JPG 
