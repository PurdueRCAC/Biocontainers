.. _backbone-label:

Poppunk
==============================

Introduction
~~~~~~~~
PopPUNK is a tool for clustering genomes. We refer to the clusters as variable-length-k-mer clusters, or VLKCs. Biologically, these clusters typically represent distinct strains. We refer to subclusters of strains as lineages.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/poppunk 
| Home page: https://github.com/bacpop/PopPUNK

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.5.0
- 2.6.0

Commands
~~~~~~~
- poppunk
- poppunk_add_weights.py
- poppunk_assign
- poppunk_batch_mst.py
- poppunk_calculate_rand_indices.py
- poppunk_calculate_silhouette.py
- poppunk_easy_run.py
- poppunk_extract_components.py
- poppunk_extract_distances.py
- poppunk_info
- poppunk_iterate.py
- poppunk_mandrake
- poppunk_mst
- poppunk_references
- poppunk_visualise

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load poppunk

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run poppunk on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=poppunk
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers poppunk

