.. _backbone-label:  

Mothur
============================== 

Introduction
~~~~~~~
``Mothur`` is an open source software package for bioinformatics data processing. The package is frequently used in the analysis of DNA from uncultured microbes. 

Detailed information about Mothur can be found here: https://mothur.org

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.46.0, 1.47.0, 1.48.0
  * - BELL
    - 1.46.0, 1.47.0, 1.48.0
  * - GAUTSCHI
    - 1.46.0, 1.47.0, 1.48.0
  * - NEGISHI
    - 1.46.0, 1.47.0, 1.48.0, 1.48.3
  * - SCHOLAR
    - 1.46.0, 1.47.0, 1.48.0

Commands
~~~~~~
- mothur

Module
~~~~~~~
You can load the modules by::
 
   module load biocontainers  
   module load mothur/1.47.0 


Interactive job
~~~~~~
To run ``mothur`` interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers mothur/1.47.0 
   (base) UserID@bell-a008:~ $ mothur
   Linux version

   Using ReadLine,Boost,HDF5,GSL
   mothur v.1.47.0
   Last updated: 1/21/22
   by
   Patrick D. Schloss

   Department of Microbiology & Immunology

   University of Michigan
   http://www.mothur.org

   When using, please cite:
   Schloss, P.D., et al., Introducing mothur: Open-source, platform-independent, community-supported software for describing and comparing microbial communities. Appl Environ Microbiol, 2009. 75(23):7537-41.

   Distributed under the GNU General Public License

   Type 'help()' for information on the commands that are available

   For questions and analysis support, please visit our forum at https://forum.mothur.org

   Type 'quit()' to exit program

   [NOTE]: Setting random seed to 19760620.

   Interactive Mode

   mothur > align.seqs(help)
   mothur > quit() 

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
    #SBATCH --job-name=mothur
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mothur/1.47.0 
   
    mothur batch_file
   
