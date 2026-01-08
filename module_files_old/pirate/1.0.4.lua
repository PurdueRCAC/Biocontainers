-- The MIT License (MIT)
--
-- Copyright (c) 2021 Purdue University
-- Copyright (c) 2020 NVIDIA Corporation
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to
-- deal in the Software without restriction, including without limitation the
-- rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
-- sell copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
-- IN THE SOFTWARE.

help([==[

Description
===========
Pirate is a pangenome analysis and threshold evaluation toolbox. 

More information
================
 - BioContainers: https://biocontainers.pro/tools/pirate
 - Home page:   https://github.com/SionBayliss/PIRATE
]==])

whatis("Name: Pirate")
whatis("Version: 1.0.4")
whatis("Description: Pirate is a pangenome analysis and threshold evaluation toolbox.")
whatis("BioContainers: https://biocontainers.pro/tools/pirate")
whatis("Home page:     https://github.com/SionBayliss/PIRATE")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "quay.io_biocontainers_pirate:1.0.4--hdfd78af_2.sif"
local uri = "docker://quay.io/biocontainers/pirate:1.0.4--hdfd78af_2"
local programs = {"PIRATE","FET.pl", "PIRATE_to_Rtab.pl", "PIRATE_to_roary.pl", "SOAPsh.pl", "ace.pl", "analyse_blast_outputs.pl", "analyse_loci_list.pl", "annotate_treeWAS_output.pl", "bamToGBrowse.pl", "bdf2gdfont.pl", "binhex.pl", "bp_aacomp.pl", "bp_biofetch_genbank_proxy.pl", "bp_bioflat_index.pl", "bp_biogetseq.pl", "bp_blast2tree.pl", "bp_bulk_load_gff.pl", "bp_chaos_plot.pl", "bp_classify_hits_kingdom.pl", "bp_composite_LD.pl", "bp_das_server.pl", "bp_dbsplit.pl", "bp_download_query_genbank.pl", "bp_extract_feature_seq.pl", "bp_fast_load_gff.pl", "bp_fastam9_to_table.pl", "bp_fetch.pl", "bp_filter_search.pl", "bp_find-blast-matches.pl", "bp_flanks.pl", "bp_gccalc.pl", "bp_genbank2gff.pl", "bp_genbank2gff3.pl", "bp_generate_histogram.pl", "bp_heterogeneity_test.pl", "bp_hivq.pl", "bp_hmmer_to_table.pl", "bp_index.pl", "bp_load_gff.pl", "bp_local_taxonomydb_query.pl", "bp_make_mrna_protein.pl", "bp_mask_by_search.pl", "bp_meta_gff.pl", "bp_mrtrans.pl", "bp_mutate.pl", "bp_netinstall.pl", "bp_nexus2nh.pl", "bp_nrdb.pl", "bp_oligo_count.pl", "bp_parse_hmmsearch.pl", "bp_process_gadfly.pl", "bp_process_sgd.pl", "bp_process_wormbase.pl", "bp_query_entrez_taxa.pl", "bp_remote_blast.pl", "bp_revtrans-motif.pl", "bp_search2alnblocks.pl", "bp_search2gff.pl", "bp_search2table.pl", "bp_search2tribe.pl", "bp_seq_length.pl", "bp_seqconvert.pl", "bp_seqcut.pl", "bp_seqfeature_delete.pl", "bp_seqfeature_gff3.pl", "bp_seqfeature_load.pl", "bp_seqpart.pl", "bp_seqret.pl", "bp_seqretsplit.pl", "bp_split_seq.pl", "bp_sreformat.pl", "bp_taxid4species.pl", "bp_taxonomy2tree.pl", "bp_translate_seq.pl", "bp_tree2pag.pl", "bp_unflatten_seq.pl", "cd-hit-2d-para.pl", "cd-hit-clstr_2_blm8.pl", "cd-hit-div.pl", "cd-hit-para.pl", "chrom_sizes.pl", "clstr2tree.pl", "clstr2txt.pl", "clstr2xml.pl", "clstr_cut.pl", "clstr_list.pl", "clstr_list_sort.pl", "clstr_merge.pl", "clstr_merge_noorder.pl", "clstr_quality_eval.pl", "clstr_quality_eval_by_link.pl", "clstr_reduce.pl", "clstr_renumber.pl", "clstr_rep.pl", "clstr_reps_faa_rev.pl", "clstr_rev.pl", "clstr_select.pl", "clstr_select_rep.pl", "clstr_size_histogram.pl", "clstr_size_stat.pl", "clstr_sort_by.pl", "clstr_sort_prot_by.pl", "clstr_sql_tbl.pl", "clstr_sql_tbl_sort.pl", "convert_to_distmat.pl", "convert_to_treeWAS.pl", "debinhex.pl", "genomeCoverageBed.pl", "legacy_blast.pl", "make_multi_seq.pl", "pangenome_variants_to_treeWAS.pl", "paralogs_to_Rtab.pl", "plot_2d.pl", "plot_len1.pl", "stag-autoschema.pl", "stag-db.pl", "stag-diff.pl", "stag-drawtree.pl", "stag-filter.pl", "stag-findsubtree.pl", "stag-flatten.pl", "stag-grep.pl", "stag-handle.pl", "stag-itext2simple.pl", "stag-itext2sxpr.pl", "stag-itext2xml.pl", "stag-join.pl", "stag-merge.pl", "stag-mogrify.pl", "stag-parse.pl", "stag-query.pl", "stag-splitter.pl", "stag-view.pl", "stag-xml2itext.pl", "stubmaker.pl", "subsample_outputs.pl", "subset_alignments.pl", "unique_sequences.pl", "update_blastdb.pl"}
local entrypoint_args = ""

-- The absolute path to Singularity is needed so it can be invoked on remote
-- nodes without the corresponding module necessarily being loaded.
-- Trim off the training newline.
local singularity = capture("which singularity | head -c -1")

if (os.getenv("BIOC_IMAGE_DIR")) then
   image = pathJoin(os.getenv("BIOC_IMAGE_DIR"), image)

   if not (isFile(image)) then
      -- The image could not be found in the container directory
      if (mode() == "load") then
         LmodMessage("file not found: " .. image)
         LmodMessage("The container image will be pulled upon first use to the Singularity cache")
      end
      image = uri

      -- Alternatively, this could pull the container image and
      -- save it in the container directory
      --if (mode() == "load") then
      --   subprocess(singularity .. " pull " .. image .. " " .. uri)
      --end
   end
else
   -- Look for the image in the Singularity cache, and if not found
   -- download it when "singularity run" is invoked.
   image = uri
end

-- Determine Nvidia and/or AMD GPUs (to pass coresponding flag to Singularity)
local run_args = {}
if (capture("nvidia-smi -L 2>/dev/null") ~= "") then
   if (mode() == "load") then
      LmodMessage("BIOC: Enabling Nvidia GPU support in the container.")
   end
   table.insert(run_args, "--nv")
end
if (capture("/opt/rocm/bin/rocm-smi -i 2>/dev/null | grep ^GPU") ~= "") then
   if (mode() == "load") then
      LmodMessage("BIOC: Enabling AMD GPU support in the container.")
   end
   table.insert(run_args, "--rocm")
end

-- And assemble container command
local container_launch = singularity .. " run " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- Multinode support
-- setenv("OMPI_MCA_orte_launch_agent", container_launch .. " orted")

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
