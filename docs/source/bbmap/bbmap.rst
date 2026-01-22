.. _backbone-label:

Bbmap
==============================

Introduction
~~~~~~~~
Bbmap is a short read aligner, as well as various other bioinformatic tools.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bbmap 
| Home page: https://sourceforge.net/projects/bbmap

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
    - 38.93, 38.96
  * - BELL
    - 38.93, 38.96
  * - GAUTSCHI
    - 38.93, 38.96
  * - NEGISHI
    - 38.93, 38.96
  * - SCHOLAR
    - 38.93, 38.96

Commands
~~~~~~~
- addadapters.sh
- a_sample_mt.sh
- bbcountunique.sh
- bbduk.sh
- bbest.sh
- bbfakereads.sh
- bbmap.sh
- bbmapskimmer.sh
- bbmask.sh
- bbmerge-auto.sh
- bbmergegapped.sh
- bbmerge.sh
- bbnorm.sh
- bbqc.sh
- bbrealign.sh
- bbrename.sh
- bbsketch.sh
- bbsplitpairs.sh
- bbsplit.sh
- bbstats.sh
- bbversion.sh
- bbwrap.sh
- calcmem.sh
- calctruequality.sh
- callpeaks.sh
- callvariants2.sh
- callvariants.sh
- clumpify.sh
- commonkmers.sh
- comparesketch.sh
- comparevcf.sh
- consect.sh
- countbarcodes.sh
- countgc.sh
- countsharedlines.sh
- crossblock.sh
- crosscontaminate.sh
- cutprimers.sh
- decontaminate.sh
- dedupe2.sh
- dedupebymapping.sh
- dedupe.sh
- demuxbyname.sh
- diskbench.sh
- estherfilter.sh
- explodetree.sh
- filterassemblysummary.sh
- filterbarcodes.sh
- filterbycoverage.sh
- filterbyname.sh
- filterbysequence.sh
- filterbytaxa.sh
- filterbytile.sh
- filterlines.sh
- filtersam.sh
- filtersubs.sh
- filtervcf.sh
- fungalrelease.sh
- fuse.sh
- getreads.sh
- gi2ancestors.sh
- gi2taxid.sh
- gitable.sh
- grademerge.sh
- gradesam.sh
- idmatrix.sh
- idtree.sh
- invertkey.sh
- kcompress.sh
- khist.sh
- kmercountexact.sh
- kmercountmulti.sh
- kmercoverage.sh
- loadreads.sh
- loglog.sh
- makechimeras.sh
- makecontaminatedgenomes.sh
- makepolymers.sh
- mapPacBio.sh
- matrixtocolumns.sh
- mergebarcodes.sh
- mergeOTUs.sh
- mergesam.sh
- msa.sh
- mutate.sh
- muxbyname.sh
- normandcorrectwrapper.sh
- partition.sh
- phylip2fasta.sh
- pileup.sh
- plotgc.sh
- postfilter.sh
- printtime.sh
- processfrag.sh
- processspeed.sh
- randomreads.sh
- readlength.sh
- reducesilva.sh
- reformat.sh
- removebadbarcodes.sh
- removecatdogmousehuman.sh
- removehuman2.sh
- removehuman.sh
- removemicrobes.sh
- removesmartbell.sh
- renameimg.sh
- rename.sh
- repair.sh
- replaceheaders.sh
- representative.sh
- rqcfilter.sh
- samtoroc.sh
- seal.sh
- sendsketch.sh
- shred.sh
- shrinkaccession.sh
- shuffle.sh
- sketchblacklist.sh
- sketch.sh
- sortbyname.sh
- splitbytaxa.sh
- splitnextera.sh
- splitsam4way.sh
- splitsam6way.sh
- splitsam.sh
- stats.sh
- statswrapper.sh
- streamsam.sh
- summarizecrossblock.sh
- summarizemerge.sh
- summarizequast.sh
- summarizescafstats.sh
- summarizeseal.sh
- summarizesketch.sh
- synthmda.sh
- tadpipe.sh
- tadpole.sh
- tadwrapper.sh
- taxonomy.sh
- taxserver.sh
- taxsize.sh
- taxtree.sh
- testfilesystem.sh
- testformat2.sh
- testformat.sh
- tetramerfreq.sh
- textfile.sh
- translate6frames.sh
- unicode2ascii.sh
- webcheck.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bbmap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bbmap on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=bbmap
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bbmap

        # Your bbmap workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=bbmap
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bbmap

        # Your bbmap workflow...

  .. tab-item:: Gautschi-AI

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p ai          # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=bbmap
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bbmap

        # Your bbmap workflow...

  .. tab-item:: Gilbreth

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p a100        # Partition name
        #SBATCH --gres=gpu:1   # Number of GPUs
        #SBATCH --mem=2G       # Memory
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=bbmap
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bbmap

        # Your bbmap workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=bbmap
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers bbmap

        # Your bbmap workflow...
