.. _backbone-label:

Clara Parabricks
==============================

Introduction
~~~~~~~~
NVIDIA's Clara Parabricks brings next generation sequencing to GPUs, accelerating an array of gold-standard tooling such as BWA-MEM, GATK4, Google's DeepVariant, and many more. Users can achieve a 30-60x acceleration and 99.99% accuracy for variant calling when comparing against CPU-only BWA-GATK4 pipelines, meaning a single server can process up to 60 whole genomes per day. These tools can be easily integrated into current pipelines with drop-in replacement commands to quickly bring speed and data-center scale to a range of applications including germline, somatic and RNA workflows.



| For more information, please check:  
| NGC Container: https://catalog.ngc.nvidia.com/orgs/nvidia/teams/clara/containers/clara-parabricks
| Home page:     https://docs.nvidia.com/clara/

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 4.0.0-1
  * - GILBRETH
    - 4.0.0-1
  * - SCHOLAR
    - 4.0.0-1

Commands
~~~~~~~
- pbrun

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load parabricks

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

.. note::
   As Clara Parabricks depends on Nvidia GPU, it is only deployed in Scholar, Gilbreth, and ACCESS Anvil.
 
To run Clara Parabricks on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --gpus=1
    #SBATCH --job-name=parabricks
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers parabricks

    pbrun haplotypecaller \
      --ref  FVZG01.1.fsa_nt \
      --in-bam output.bam \
      --out-variants variants.vcf
