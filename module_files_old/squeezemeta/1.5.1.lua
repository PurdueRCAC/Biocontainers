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
SqueezeMeta is a fully automated metagenomics pipeline, from reads to bins.

More information
================
 - Home page:   https://github.com/jtamames/SqueezeMeta
]==])

whatis("Name: Abacas")
whatis("Version: 1.5.2")
whatis("Description: SqueezeMeta is a fully automated metagenomics pipeline, from reads to bins.")
whatis("Home page:   https://github.com/jtamames/SqueezeMeta")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "squeezemeta_1.5.2_configed.sif"
local programs = {"01.merge_assemblies.pl", "01.merge_sequential.pl", "01.remap.pl", "01.run_assembly.pl", "01.run_assembly_merged.pl", "02.rnas.pl", "03.run_prodigal.pl", "04.rundiamond.pl", "05.run_hmmer.pl", "06.lca.pl", "07.fun3assign.pl", "08.blastx.pl", "09.summarycontigs3.pl", "10.mapsamples.pl", "11.mcount.pl", "12.funcover.pl", "13.mergeannot2.pl", "14.runbinning.pl", "15.dastool.pl", "16.addtax2.pl", "17.checkM_batch.pl", "18.getbins.pl", "19.getcontigs.pl", "20.minpath.pl", "21.stats.pl", "SqueezeMeta.pl", "SqueezeMeta_conf.pl", "SqueezeMeta_conf_original.pl", "parameters.pl", "restart.pl", "add_database.pl", "cover.pl", "sqm2ipath.pl", "sqm2itol.pl", "sqm2keggplots.pl", "sqm2pavian.pl", "sqm_annot.pl", "sqm_hmm_reads.pl", "sqm_longreads.pl", "sqm_mapper.pl", "sqm_reads.pl", "versionchange.pl","find_missing_markers.pl", "remove_duplicate_markers.pl", "anvi-filter-sqm.py", "anvi-load-sqm.py", "sqm2anvio.pl","configure_nodb.pl", "configure_nodb_alt.pl", "download_databases.pl", "make_databases.pl", "make_databases_alt.pl", "test_install.pl"}
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
