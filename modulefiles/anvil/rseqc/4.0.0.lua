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
Rseqc is a package provides a number of useful modules that can comprehensively evaluate high throughput sequence data especially RNA-seq data. 

More information
================
 - BioContainers: https://biocontainers.pro/tools/rseqc
 - Home page:   http://rseqc.sourceforge.net
]==])

whatis("Name: Rseqc")
whatis("Version: 4.0.0")
whatis("Description: Rseqc is package provides a number of useful modules that can comprehensively evaluate high throughput sequence data especially RNA-seq data.")
whatis("BioContainers: https://biocontainers.pro/tools/rseqc")
whatis("Home page:     http://rseqc.sourceforge.net")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "RSeQC")

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "quay.io_biocontainers_rseqc:4.0.0--py37h73a75cf_1.sif"
local uri = "docker://quay.io/biocontainers/rseqc:4.0.0--py37h73a75cf_1"
local programs = {"FPKM-UQ.py", "FPKM_count.py", "RNA_fragment_size.py", "RPKM_saturation.py", "aggregate_scores_in_intervals.py", "align_print_template.py", "axt_extract_ranges.py", "axt_to_fasta.py", "axt_to_lav.py", "axt_to_maf.py", "bam2fq.py", "bam2wig.py", "bam_stat.py", "bed_bigwig_profile.py", "bed_build_windows.py", "bed_complement.py", "bed_count_by_interval.py", "bed_count_overlapping.py", "bed_coverage.py", "bed_coverage_by_interval.py", "bed_diff_basewise_summary.py", "bed_extend_to.py", "bed_intersect.py", "bed_intersect_basewise.py", "bed_merge_overlapping.py", "bed_rand_intersect.py", "bed_subtract_basewise.py", "bnMapper.py", "clipping_profile.py", "deletion_profile.py", "div_snp_table_chr.py", "divide_bam.py", "find_in_sorted_file.py", "geneBody_coverage.py", "geneBody_coverage2.py", "gene_fourfold_sites.py", "get_scores_in_intervals.py", "infer_experiment.py", "inner_distance.py", "insertion_profile.py", "int_seqs_to_char_strings.py", "interval_count_intersections.py", "interval_join.py", "junction_annotation.py", "junction_saturation.py", "lav_to_axt.py", "lav_to_maf.py", "line_select.py", "lzop_build_offset_table.py", "mMK_bitset.py", "maf_build_index.py", "maf_chop.py", "maf_chunk.py", "maf_col_counts.py", "maf_col_counts_all.py", "maf_count.py", "maf_covered_ranges.py", "maf_covered_regions.py", "maf_div_sites.py", "maf_drop_overlapping.py", "maf_extract_chrom_ranges.py", "maf_extract_ranges.py", "maf_extract_ranges_indexed.py", "maf_filter.py", "maf_filter_max_wc.py", "maf_gap_frequency.py", "maf_gc_content.py", "maf_interval_alignibility.py", "maf_limit_to_species.py", "maf_mapping_word_frequency.py", "maf_mask_cpg.py", "maf_mean_length_ungapped_piece.py", "maf_percent_columns_matching.py", "maf_percent_identity.py", "maf_print_chroms.py", "maf_print_scores.py", "maf_randomize.py", "maf_region_coverage_by_src.py", "maf_select.py", "maf_shuffle_columns.py", "maf_species_in_all_files.py", "maf_split_by_src.py", "maf_thread_for_species.py", "maf_tile.py", "maf_tile_2.py", "maf_tile_2bit.py", "maf_to_axt.py", "maf_to_concat_fasta.py", "maf_to_fasta.py", "maf_to_int_seqs.py", "maf_translate_chars.py", "maf_truncate.py", "maf_word_frequency.py", "mask_quality.py", "mismatch_profile.py", "nib_chrom_intervals_to_fasta.py", "nib_intervals_to_fasta.py", "nib_length.py", "normalize_bigwig.py", "one_field_per_line.py", "out_to_chain.py", "overlay_bigwig.py", "prefix_lines.py", "pretty_table.py", "qv_to_bqv.py", "random_lines.py", "read_GC.py", "read_NVC.py", "read_distribution.py", "read_duplication.py", "read_hexamer.py", "read_quality.py", "split_bam.py", "split_paired_bam.py", "table_add_column.py", "table_filter.py", "tfloc_summary.py", "tin.py", "ucsc_gene_table_to_intervals.py", "wiggle_to_array_tree.py", "wiggle_to_binned_array.py", "wiggle_to_chr_binned_array.py", "wiggle_to_simple.py"}
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
