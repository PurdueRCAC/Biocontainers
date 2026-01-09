.. _backbone-label:

GeneMark-ES/ET/EP
==============================

Introduction
~~~~~~~
``GeneMark-ES/ET/EP`` contains GeneMark-ES, GeneMark-ET and GeneMark-EP+ algorithms. 

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 4.68, 4.69
  * - BELL
    - 4.68, 4.69
  * - GAUTSCHI
    - 4.68, 4.69
  * - NEGISHI
    - 4.68, 4.69
  * - SCHOLAR
    - 4.68, 4.69

Commands
~~~~~~~
- bed_to_gff.pl
- bp_seq_select.pl
- build_mod.pl
- calc_introns_from_gtf.pl
- change_path_in_perl_scripts.pl
- compare_intervals_exact.pl
- gc_distr.pl
- get_below_gc.pl
- get_sequence_from_GTF.pl
- gmes_petap.pl
- hc_exons2hints.pl
- histogram.pl
- make_nt_freq_mat.pl
- parse_ET.pl
- parse_by_introns.pl
- parse_gibbs.pl
- parse_set.pl
- predict_genes.pl
- reformat_gff.pl
- rescale_gff.pl
- rnaseq_introns_to_gff.pl
- run_es.pl
- run_hmm_pbs.pl
- scan_for_bp.pl
- star_to_gff.pl
- verify_evidence_gmhmm.pl

Academic license
~~~~~
.. note::
To use GeneMark, users need to download license files by yourself.   

Go to the GeneMark web site: http://exon.gatech.edu/GeneMark/license_download.cgi. Check the boxes for ``GeneMark-ES/ET/EP ver 4.69_lic`` and ``LINUX 64`` next to it, fill out the form, then click "I agree". In the next page, right click and copy the link addresses for ``64 bit`` licenss. Paste the link addresses in the commands below::

    cd $HOME
    wget "replace with license URL"
    zcat gm_key_64.gz > .gm_key

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load genemark/4.68 

Example job
~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run GeneMark on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=genemark
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers genemark/4.68  
    
    gmes_petap.pl --ES  --cores 24 --sequence scaffolds.fasta

     
    

    
