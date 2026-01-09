.. _backbone-label:

IGV
==============================

Introduction
~~~~~~~~
``IGV`` (Integrative Genomics Viewer) is a high-performance, easy-to-use, interactive tool for the visual exploration of genomic data. 

| For more information, please check its home page: http://www.broadinstitute.org/software/igv/home.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.11.9, 2.12.3, 2.17.3
  * - BELL
    - 2.11.9, 2.12.3, 2.17.3
  * - GAUTSCHI
    - 2.11.9, 2.12.3, 2.17.3
  * - NEGISHI
    - 2.11.9, 2.12.3, 2.17.3, 2.19.1
  * - SCHOLAR
    - 2.11.9, 2.12.3

Commands
~~~~~~~
- igv_hidpi.sh
- igv.sh

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load igv

Interactive  job
~~~~~
Since IGV requires GUI, it is recommended to run it within ThinLinc::

    (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
     salloc: Granted job allocation 12345869
     salloc: Waiting for resource configuration
     salloc: Nodes bell-a008 are ready for job
    (base) UserID@bell-a008:~ $ module --force purge
    (base) UserID@bell-a008:~ $ ml biocontainers igv
    (base) UserID@bell-a008:~ $ igv.sh
