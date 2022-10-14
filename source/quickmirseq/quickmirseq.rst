.. _backbone-label:

QuickMIRSeq
==============================

Introduction
~~~~~~~~
``QuickMIRSeq`` is an integrated pipeline for quick and accurate quantification of known miRNAs and isomiRs by jointly processing multiple samples.


| For more information, please check its | Docker hub: https://hub.docker.com/r/gcfntnu/quickmirseq and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0

Commands
~~~~~~~
- perl
- QuickMIRSeq-report.sh

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load quickmirseq

.. note::
   
   This module defines program installation directory (note: inside the container!) as environment variable ``$QuickMIRSeq``. Once again, this is not a host path, this path is only available from inside the container.

   With the way this module is organized, you should be able to use the variable freely for both the ``perl $QuickMIRSeq/QuickMIRSeq.pl allIDs.txt run.config`` and the ``$QuickMIRSeq/QuickMIRSeq-report.sh`` steps as directed by the user guide.
  
   A simple ``QuickMIRSeq.pl`` and ``QuickMIRSeq-report.sh`` will also work (and can be a backup if the variable expansion somehow does not work for you).

   You will also need a run configuration file. You can copy from an existing one, or take from the user guide, or as a last resort, use Singularity to copy the template (in ``$QuickMIRSeq/run.config.template``) from inside the container image. ``singularity shell`` may be an easiest way for the latter.

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run QuickMIRSeq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=quickmirseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers quickmirseq

    quickmerge -d out.rq.delta -q q.fasta -r scab8722.fasta  -hco 5.0 -c 1.5 -l n -ml m -p prefix
.. _Github: https://baohongz.github.io/guide/QuickMIRSeq.html
