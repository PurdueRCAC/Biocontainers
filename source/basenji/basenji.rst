.. _backbone-label:

Basenji
==============================

Introduction
~~~~~~~~
``Basenji`` is a tool for sequential regulatory activity predictions with deep convolutional neural networks. 
| For more information, please check its website: https://biocontainers.pro/tools/basenji and its home page on `Github`_.

Versions
~~~~~~~~
- 0.5.1

Commands
~~~~~~~
- akita_data.py
- akita_data_read.py
- akita_data_write.py
- akita_predict.py
- akita_sat_plot.py
- akita_sat_vcf.py
- akita_scd.py
- akita_scd_multi.py
- akita_test.py
- akita_train.py
- bam_cov.py
- basenji_annot_chr.py
- basenji_bench_classify.py
- basenji_bench_gtex.py
- basenji_bench_gtex_cmp.py
- basenji_bench_phylop.py
- basenji_bench_phylop_folds.py
- basenji_cmp.py
- basenji_data.py
- basenji_data2.py
- basenji_data_align.py
- basenji_data_gene.py
- basenji_data_hic_read.py
- basenji_data_hic_write.py
- basenji_data_read.py
- basenji_data_write.py
- basenji_fetch_app.py
- basenji_fetch_app1.py
- basenji_fetch_app2.py
- basenji_fetch_norm.py
- basenji_fetch_vcf.py
- basenji_gtex_folds.py
- basenji_hdf5_genes.py
- basenji_hidden.py
- basenji_map.py
- basenji_map_genes.py
- basenji_map_seqs.py
- basenji_motifs.py
- basenji_motifs_denovo.py
- basenji_norm_h5.py
- basenji_predict.py
- basenji_predict_bed.py
- basenji_predict_bed_multi.py
- basenji_sad.py
- basenji_sad_multi.py
- basenji_sad_norm.py
- basenji_sad_ref.py
- basenji_sad_ref_multi.py
- basenji_sad_table.py
- basenji_sat_bed.py
- basenji_sat_bed_multi.py
- basenji_sat_folds.py
- basenji_sat_plot.py
- basenji_sat_plot2.py
- basenji_sat_vcf.py
- basenji_sed.py
- basenji_sed_multi.py
- basenji_sedg.py
- basenji_test.py
- basenji_test_folds.py
- basenji_test_genes.py
- basenji_test_reps.py
- basenji_test_specificity.py
- basenji_train.py
- basenji_train1.py
- basenji_train2.py
- basenji_train_folds.py
- basenji_train_hic.py
- basenji_train_reps.py
- save_model.py
- sonnet_predict_bed.py
- sonnet_sad.py
- sonnet_sad_multi.py
- sonnet_sat_bed.py
- sonnet_sat_vcf.py
- tfr_bw.py
- tfr_hdf5.py
- tfr_qc.py
- upgrade_tf1.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load basenji

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Basenji on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=basenji
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers basenji

.. _Github: https://github.com/calico/basenji
