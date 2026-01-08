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
Agat is a suite of tools to handle gene annotations in any GTF/GFF format.

More information
================
 - BioContainers: https://biocontainers.pro/tools/agat
 - Home page:   https://github.com/NBISweden/AGAT
]==])

whatis("Name: Agat")
whatis("Version: 0.8.1")
whatis("Description: Agat is a suite of tools to handle gene annotations in any GTF/GFF format.")
whatis("BioContainers: https://biocontainers.pro/tools/agat")
whatis("Home page:     https://github.com/NBISweden/AGAT")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(),"AGAT")

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "quay.io_biocontainers_agat:0.8.1--pl5262hdfd78af_0.sif"
local uri = "docker://quay.io/biocontainers/agat:0.8.1--pl5262hdfd78af_0"
local programs = {"agat_convert_bed2gff.pl", "agat_convert_embl2gff.pl", "agat_convert_genscan2gff.pl", "agat_convert_mfannot2gff.pl", "agat_convert_minimap2_bam2gff.pl", "agat_convert_sp_gff2bed.pl", "agat_convert_sp_gff2gtf.pl", "agat_convert_sp_gff2tsv.pl", "agat_convert_sp_gff2zff.pl", "agat_convert_sp_gxf2gxf.pl", "agat_sp_Prokka_inferNameFromAttributes.pl", "agat_sp_add_introns.pl", "agat_sp_add_start_and_stop.pl", "agat_sp_alignment_output_style.pl", "agat_sp_clipN_seqExtremities_and_fixCoordinates.pl", "agat_sp_compare_two_BUSCOs.pl", "agat_sp_compare_two_annotations.pl", "agat_sp_complement_annotations.pl", "agat_sp_ensembl_output_style.pl", "agat_sp_extract_attributes.pl", "agat_sp_extract_sequences.pl", "agat_sp_filter_by_ORF_size.pl", "agat_sp_filter_by_locus_distance.pl", "agat_sp_filter_by_mrnaBlastValue.pl", "agat_sp_filter_feature_by_attribute_presence.pl", "agat_sp_filter_feature_by_attribute_value.pl", "agat_sp_filter_feature_from_keep_list.pl", "agat_sp_filter_feature_from_kill_list.pl", "agat_sp_filter_gene_by_intron_numbers.pl", "agat_sp_filter_gene_by_length.pl", "agat_sp_filter_incomplete_gene_coding_models.pl", "agat_sp_filter_record_by_coordinates.pl", "agat_sp_fix_cds_phases.pl", "agat_sp_fix_features_locations_duplicated.pl", "agat_sp_fix_fusion.pl", "agat_sp_fix_longest_ORF.pl", "agat_sp_fix_overlaping_genes.pl", "agat_sp_fix_small_exon_from_extremities.pl", "agat_sp_flag_premature_stop_codons.pl", "agat_sp_flag_short_introns.pl", "agat_sp_functional_statistics.pl", "agat_sp_keep_longest_isoform.pl", "agat_sp_kraken_assess_liftover.pl", "agat_sp_list_short_introns.pl", "agat_sp_load_function_from_protein_align.pl", "agat_sp_manage_IDs.pl", "agat_sp_manage_UTRs.pl", "agat_sp_manage_attributes.pl", "agat_sp_manage_functional_annotation.pl", "agat_sp_manage_introns.pl", "agat_sp_merge_annotations.pl", "agat_sp_prokka_fix_fragmented_gene_annotations.pl", "agat_sp_sensitivity_specificity.pl", "agat_sp_separate_by_record_type.pl", "agat_sp_statistics.pl", "agat_sp_webApollo_compliant.pl", "agat_sq_add_attributes_from_tsv.pl", "agat_sq_add_hash_tag.pl", "agat_sq_add_locus_tag.pl", "agat_sq_count_attributes.pl", "agat_sq_filter_feature_from_fasta.pl", "agat_sq_list_attributes.pl", "agat_sq_manage_IDs.pl", "agat_sq_manage_attributes.pl", "agat_sq_mask.pl", "agat_sq_remove_redundant_entries.pl", "agat_sq_repeats_analyzer.pl", "agat_sq_rfam_analyzer.pl", "agat_sq_split.pl", "agat_sq_stat_basic.pl"}
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
local container_launch = singularity .. " exec " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- Multinode support
-- setenv("OMPI_MCA_orte_launch_agent", container_launch .. " orted")

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
