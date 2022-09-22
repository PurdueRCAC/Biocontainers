.. _backbone-label:

Squeezemeta
==============================

Introduction
~~~~~~~~
SqueezeMeta is a fully automated metagenomics pipeline, from reads to bins.
For more information, please check:
Home page: https://github.com/jtamames/SqueezeMeta

Versions
~~~~~~~~
- 1.5.1

Commands
~~~~~~~
- 01.merge_assemblies.pl
- 01.merge_sequential.pl
- 01.remap.pl
- 01.run_assembly.pl
- 01.run_assembly_merged.pl
- 02.rnas.pl
- 03.run_prodigal.pl
- 04.rundiamond.pl
- 05.run_hmmer.pl
- 06.lca.pl
- 07.fun3assign.pl
- 08.blastx.pl
- 09.summarycontigs3.pl
- 10.mapsamples.pl
- 11.mcount.pl
- 12.funcover.pl
- 13.mergeannot2.pl
- 14.runbinning.pl
- 15.dastool.pl
- 16.addtax2.pl
- 17.checkM_batch.pl
- 18.getbins.pl
- 19.getcontigs.pl
- 20.minpath.pl
- 21.stats.pl
- SqueezeMeta.pl
- SqueezeMeta_conf.pl
- SqueezeMeta_conf_original.pl
- parameters.pl
- restart.pl
- add_database.pl
- cover.pl
- sqm2ipath.pl
- sqm2itol.pl
- sqm2keggplots.pl
- sqm2pavian.pl
- sqm_annot.pl
- sqm_hmm_reads.pl
- sqm_longreads.pl
- sqm_mapper.pl
- sqm_reads.pl
- versionchange.pl
- find_missing_markers.pl
- remove_duplicate_markers.pl
- anvi-filter-sqm.py
- anvi-load-sqm.py
- sqm2anvio.pl
- configure_nodb.pl
- configure_nodb_alt.pl
- download_databases.pl
- make_databases.pl
- make_databases_alt.pl
- test_install.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load squeezemeta

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run squeezemeta on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=squeezemeta
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers squeezemeta

    SqueezeMeta.pl -m coassembly -p Hadza -s test.samples -f raw
