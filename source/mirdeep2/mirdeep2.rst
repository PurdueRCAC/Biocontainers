.. _backbone-label:

miRDeep2
==============================

Introduction
~~~~~~~~
``miRDeep2`` discovers active known or novel miRNAs from deep sequencing data (Solexa/Illumina, 454, ...). 
| For more information, please check its website: https://biocontainers.pro/tools/mirdeep2 and its home page on `Github`_.

Versions
~~~~~~~~
- 2.0.1.3

Commands
~~~~~~~
- bwa_sam_converter.pl
- clip_adapters.pl
- collapse_reads_md.pl
- convert_bowtie_output.pl
- excise_precursors_iterative_final.pl
- excise_precursors.pl
- extract_miRNAs.pl
- fastaparse.pl
- fastaselect.pl
- fastq2fasta.pl
- find_read_count.pl
- geo2fasta.pl
- get_mirdeep2_precursors.pl
- illumina_to_fasta.pl
- make_html2.pl
- make_html.pl
- mapper.pl
- mirdeep2bed.pl
- miRDeep2_core_algorithm.pl
- miRDeep2.pl
- parse_mappings.pl
- perform_controls.pl
- permute_structure.pl
- prepare_signature.pl
- quantifier.pl
- remove_white_space_in_id.pl
- rna2dna.pl
- samFLAGinfo.pl
- sam_reads_collapse.pl
- sanity_check_genome.pl
- sanity_check_mapping_file.pl
- sanity_check_mature_ref.pl
- sanity_check_reads_ready_file.pl
- select_for_randfold.pl
- survey.pl

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load mirdeep2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run miRDeep2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mirdeep2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mirdeep2

.. _Github: https://github.com/rajewsky-lab/mirdeep2
