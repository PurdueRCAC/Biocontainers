.. _backbone-label:

Pvactools
==============================

Introduction
~~~~~~~~
pVACtools is a cancer immunotherapy tools suite consisting of pVACseq, pVACbind, pVACfuse, pVACvector, and pVACview.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/griffithlab/pvactools/ 
| Home page: https://pvactools.readthedocs.io/en/latest/

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 3.0.1
  * - BELL
    - 3.0.1
  * - GAUTSCHI
    - 3.0.1
  * - NEGISHI
    - 3.0.1
  * - SCHOLAR
    - 3.0.1

Commands
~~~~~~~
- pvacbind
- pvacfuse
- pvacseq
- pvactools
- pvacvector
- pvacview

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pvactools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pvactools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pvactools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pvactools

    pvacseq download_example_data .

    pvacseq run \
      pvacseq_example_data/input.vcf \
      Test \
      HLA-A*02:01,HLA-B*35:01,DRB1*11:01 \
      MHCflurry MHCnuggetsI MHCnuggetsII NNalign NetMHC PickPocket SMM SMMPMBEC SMMalign \
      pvacseq_output_data \
      -e1 8,9,10 \
      -e2 15 \
      --iedb-install-directory /opt/iedb
