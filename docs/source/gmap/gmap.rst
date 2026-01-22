.. _backbone-label:

Gmap
==============================

Introduction
~~~~~~~~
Gmap is a genomic mapping and alignment program for mRNA and EST sequences.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gmap 
| Home page: http://research-pub.gene.com/gmap/

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
    - 2021.05.27, 2021.08.25
  * - BELL
    - 2021.05.27, 2021.08.25
  * - GAUTSCHI
    - 2021.05.27, 2021.08.25
  * - NEGISHI
    - 2021.05.27, 2021.08.25
  * - SCHOLAR
    - 2021.05.27, 2021.08.25

Commands
~~~~~~~
- atoiindex
- cmetindex
- cpuid
- dbsnp_iit
- ensembl_genes
- fa_coords
- get-genome
- gff3_genes
- gff3_introns
- gff3_splicesites
- gmap
- gmap.avx2
- gmap_build
- gmap_cat
- gmapindex
- gmapl
- gmapl.avx2
- gmapl.nosimd
- gmap.nosimd
- gmap_process
- gsnap
- gsnap.avx2
- gsnapl
- gsnapl.avx2
- gsnapl.nosimd
- gsnap.nosimd
- gtf_genes
- gtf_introns
- gtf_splicesites
- gtf_transcript_splicesites
- gvf_iit
- iit_dump
- iit_get
- iit_store
- indexdb_cat
- md_coords
- psl_genes
- psl_introns
- psl_splicesites
- sam_sort
- snpindex
- trindex
- vcf_iit

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gmap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gmap on our clusters:

.. tab-set::

  .. tab-item:: Anvil

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A myallocation     # Allocation name
        #SBATCH -p wholenode        # Partition name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=gmap
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers gmap

        # Your gmap workflow...

  .. tab-item:: Bell, Gautschi, or Negishi

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A mygroup     # Group name
        #SBATCH -p cpu         # Partition name
        #SBATCH -q normal      # QOS name (optional)
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=gmap
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers gmap

        # Your gmap workflow...

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
        #SBATCH --job-name=gmap
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers gmap

        # Your gmap workflow...

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
        #SBATCH --job-name=gmap
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers gmap

        # Your gmap workflow...

  .. tab-item:: Scholar

    .. code-block:: bash

        #!/bin/bash
        #SBATCH -A queue     # Queue name
        #SBATCH -t 1:00:00
        #SBATCH -N 1
        #SBATCH -n 1
        #SBATCH --job-name=gmap
        #SBATCH --mail-type=FAIL,BEGIN,END
        #SBATCH --error=%x-%J-%u.err
        #SBATCH --output=%x-%J-%u.out

        module --force purge
        module biocontainers gmap

        # Your gmap workflow...
