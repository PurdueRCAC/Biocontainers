.. _backbone-label:

Clair3
==============================

Introduction
~~~~~~~~
Clair3 is a germline small variant caller for long-reads. Clair3 makes the best of two major method categories: pileup calling handles most variant candidates with speed, and full-alignment tackles complicated candidates to maximize precision and recall. Clair3 runs fast and has superior performance, especially at lower coverage. Clair3 is simple and modular for easy deployment and integration.
For more information, please check:
Docker hub: https://hub.docker.com/r/hkubal/clair3 
Home page: https://github.com/HKU-BAL/Clair3

Versions
~~~~~~~~
- 0.1-r11
- 0.1-r12

Commands
~~~~~~~
- run_clair3.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load clair3

Model_path
~~~~  
.. note::
   ``model_path`` is in ``/opt/models/``. The parameter will be like this ``--model_path="/opt/models/MODEL_NAME"`` 

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run clair3 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=clair3
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers clair3

    run_clair3.sh \
          --bam_fn=input.bam \
          --ref_fn=ref.fasta \
          --threads=12 \
          --platform=ont \
          --model_path="/opt/models/ont" \
          --output=output
