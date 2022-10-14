.. _backbone-label:

Evidencemodeler
==============================

Introduction
~~~~~~~~
``Evidencemodeler`` is a software combines ab intio gene predictions and protein and transcript alignments into weighted consensus gene structures. 
| For more information, please check its website: https://biocontainers.pro/tools/evidencemodeler and its home page on `Github`_.

Versions
~~~~~~~~
- 1.1.1

Commands
~~~~~~~
- evidence_modeler.pl
- BPbtab.pl
- EVMLite.pl
- EVM_to_GFF3.pl
- convert_EVM_outputs_to_GFF3.pl
- create_weights_file.pl
- execute_EVM_commands.pl
- extract_complete_proteins.pl
- gff3_file_to_proteins.pl
- gff3_gene_prediction_file_validator.pl
- gff_range_retriever.pl
- partition_EVM_inputs.pl
- recombine_EVM_partial_outputs.pl
- summarize_btab_tophits.pl
- write_EVM_commands.pl

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load evidencemodeler

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Evidencemodeler on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=evidencemodeler
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers evidencemodeler

    
    evidence_modeler.pl --genome genome.fasta \
                       --weights weights.txt \
                       --gene_predictions gene_predictions.gff3 \
                       --protein_alignments protein_alignments.gff3 \
                       --transcript_alignments transcript_alignments.gff3 \
                     > evm.out 
.. _Github: https://github.com/EVidenceModeler/EVidenceModeler
