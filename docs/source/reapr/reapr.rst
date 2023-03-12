.. _backbone-label:

Reapr
==============================

Introduction
~~~~~~~~
Reapr is a tool that evaluates the accuracy of a genome assembly using mapped paired end reads.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/reapr 
| Home page: https://www.sanger.ac.uk/tool/reapr/

Notes provided by Neelam Jha
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
https://bioinformaticsonline.com/bookmarks/view/26925/reapr-a-universal-tool-for-genome-assembly-evaluation
Reapr is a tool trying to find explicit errors in the assembly based on incongruently mapped reads. It is heavily based on too low span coverage, or reads mapping too far or too close to each other. The program will also break up contigs/scaffolds at spurious sites to form smaller (but hopefully correct) contigs. Reapr runs pretty slowly, sadly,

Reapr is a bit fuzzy with contig names, but luckily it’s given us a tool to check if things are ok before we proceed! The command ``reapr facheck <assembly.fasta>`` will tell you if everything’s ok! in this case, no output is good output, since the only output from the command is the potential problems with the contig names. If you run into any problems, run ``reapr facheck <assembly.fasta> <renamed_assembly.fasta>``, and you will get an assembly file with renamed contigs.

Once the names are ok, we continue:

The first thing we reapr needs, is a list of all “perfect” reads. This is reads that have a perfect map to the reference. Reapr is finicky though, and can’t use libraries with different read lengths, so you’ll have to use assemblies based on the raw data for this. Run the command ``reapr perfectmap`` to get information on how to create a perfect mapping file, and create a perfect mapping called ``<assembler>_perfect``. 

The next tool we need is ``reapr smaltmap`` which creates a bam file of read-pair mappings. Do the same thing you did with perfectmap and create an output file called ``<assembler>_smalt.bam``.

Finally we can use the smalt mapping, and the perfect mapping to run the ``reapr pipeline``. Run ``reapr pipeline`` to get help on how to run, and then run the pipeline. Store the results in ``reapr_<assembler>``.

Versions
~~~~~~~~
- 1.0.18

Commands
~~~~~~~
- reapr

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load reapr

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run reapr on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=reapr
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers reapr

    reapr facheck Assembly.fasta renamedAssembly.fasta
    reapr perfectmap renamedAssembly.fasta reads_1.fastq reads_2.fastq 100 outputPrefix
    reapr smaltmap renamedAssembly.fasta reads_1.fastq reads_2.fastq mapped.bam
    reapr pipeline renamedAssembly.fasta mapped.bam pipeoutdir outputPrefix
