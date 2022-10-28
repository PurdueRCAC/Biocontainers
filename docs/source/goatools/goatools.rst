.. _backbone-label:  

goatools
============================== 

Introduction
~~~~~~~
``Goatools`` is a python library for gene ontology analyses. Detailed information about its usage can be found here: https://github.com/tanghaibao/goatools

Versions
~~~~~~~~
- 1.1.12
- 1.2.3

Commands
~~~~~~
- python
- python3
- compare_gos.py
- fetch_associations.py
- find_enrichment.py
- go_plot.py
- map_to_slim.py
- ncbi_gene_results_to_python.py
- plot_go_term.py
- prt_terms.py
- runxlrd.py
- vba_extract.py
- wr_hier.py
- wr_sections.py

Module
~~~~~~~
You can load the modules by::
 
   module load biocontainers  
   module load goatools/1.1.12

Interactive job
~~~~~~
To run goatools interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers goatools/1.1.12
   (base) UserID@bell-a008:~ $ python
   Python 3.8.10 (default, Nov 26 2021, 20:14:08)
   [GCC 9.3.0] on linux
   Type "help", "copyright", "credits" or "license" for more information.  
   >>> from goatools.base import download_go_basic_obo
   >>> obo_fname = download_go_basic_obo()
   
Batch job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To submit a sbatch job on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=goatools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers goatools/1.1.12
   
    python script.py
    
    find_enrichment.py --pval=0.05 --indent data/study data/population data/association
    
    go_plot.py --go_file=tests/data/go_plot/go_heartjogging6.txt -r -o heartjogging6_r1.png
