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
miRDeep2 discovers active known or novel miRNAs from deep sequencing data
(Solexa/Illumina, 454, ...).

More information
================
 - BioContainers: https://biocontainers.pro/tools/mirdeep2
 - Home page:     https://github.com/rajewsky-lab/mirdeep2
]==])

whatis("Name: miRDeep2")
whatis("Version: 2.0.1.3")
whatis("Description: miRDeep2 discovers active known or novel miRNAs from deep sequencing data (Solexa/Illumina, 454, ...).")
whatis("BioContainers: https://biocontainers.pro/tools/mirdeep2")
whatis("Home page:     https://github.com/rajewsky-lab/mirdeep2")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "miRDeep2", "mirdeep", "miRDeep")

local image = "quay.io_biocontainers_mirdeep2:2.0.1.3--hdfd78af_0.sif"
local uri = "docker://quay.io/biocontainers/mirdeep2:2.0.1.3--hdfd78af_0"
local programs = { "bwa_sam_converter.pl", "clip_adapters.pl",
                  "collapse_reads_md.pl", "convert_bowtie_output.pl",
                  "excise_precursors_iterative_final.pl", "excise_precursors.pl",
                  "extract_miRNAs.pl", "fastaparse.pl", "fastaselect.pl",
                  "fastq2fasta.pl", "find_read_count.pl", "geo2fasta.pl",
                  "get_mirdeep2_precursors.pl", "illumina_to_fasta.pl",
                  "make_html2.pl", "make_html.pl", "mapper.pl",
                  "mirdeep2bed.pl", "miRDeep2_core_algorithm.pl",
                  "miRDeep2.pl", "parse_mappings.pl", "perform_controls.pl",
                  "permute_structure.pl", "prepare_signature.pl",
                  "quantifier.pl", "remove_white_space_in_id.pl",
                  "rna2dna.pl", "samFLAGinfo.pl",
                  "sam_reads_collapse.pl", "sanity_check_genome.pl",
                  "sanity_check_mapping_file.pl", "sanity_check_mature_ref.pl",
                  "sanity_check_reads_ready_file.pl", "select_for_randfold.pl",
                  "survey.pl",
                 }
-- Container has C, C.UTF-8 and POSIX locales - force to avoid Perl warnings.
local entrypoint_args = "env LANG=C.UTF-8"

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

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
