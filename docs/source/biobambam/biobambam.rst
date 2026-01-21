.. _backbone-label:

Biobambam
==============================

Introduction
~~~~~~~~
Biobambam is a collection of tools for early stage alignment file processing.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/biobambam 
| Home page: https://gitlab.com/german.tischler/biobambam2

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
    - 2.0.183
  * - BELL
    - 2.0.183
  * - GAUTSCHI
    - 2.0.183
  * - NEGISHI
    - 2.0.183
  * - SCHOLAR
    - 2.0.183

Commands
~~~~~~~
- bam12auxmerge
- bam12split
- bam12strip
- bamadapterclip
- bamadapterfind
- bamalignfrac
- bamauxmerge
- bamauxmerge2
- bamauxsort
- bamcat
- bamchecksort
- bamclipXT
- bamclipreinsert
- bamcollate2
- bamdepth
- bamdepthintersect
- bamdifference
- bamdownsamplerandom
- bamexplode
- bamexploderef
- bamfastcat
- bamfastexploderef
- bamfastnumextract
- bamfastsplit
- bamfeaturecount
- bamfillquery
- bamfilteraux
- bamfiltereofblocks
- bamfilterflags
- bamfilterheader
- bamfilterheader2
- bamfilterk
- bamfilterlength
- bamfiltermc
- bamfilternames
- bamfilterrefid
- bamfilterrg
- bamfixmateinformation
- bamfixpairinfo
- bamflagsplit
- bamindex
- bamintervalcomment
- bamintervalcommenthist
- bammapdist
- bammarkduplicates
- bammarkduplicates2
- bammarkduplicatesopt
- bammaskflags
- bammdnm
- bammerge
- bamnumericalindex
- bamnumericalindexstats
- bamrank
- bamranksort
- bamrecalculatecigar
- bamrecompress
- bamrefextract
- bamrefinterval
- bamreheader
- bamreplacechecksums
- bamreset
- bamscrapcount
- bamseqchksum
- bamsormadup
- bamsort
- bamsplit
- bamsplitdiv
- bamstreamingmarkduplicates
- bamtofastq
- bamvalidate
- bamzztoname

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load biobambam

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run biobambam on our clusters::

.. tab-set::

   .. tab-item:: Anvil

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=biobambam
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers biobambam

   .. tab-item:: Bell/Gautschi/Negishi

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=biobambam
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers biobambam

   .. tab-item:: Gautschi-AI/Gilbreth

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p a100        # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=biobambam
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers biobambam

   .. tab-item:: Scholar

      .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=biobambam
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers biobambam
