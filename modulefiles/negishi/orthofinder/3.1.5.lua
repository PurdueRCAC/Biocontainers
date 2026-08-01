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
OrthoFinder is a fast, accurate and comprehensive platform for comparative
genomics. It finds orthogroups and orthologs, infers rooted gene trees for
all orthogroups and identifies all of the gene duplication events in those
gene trees. It also infers a rooted species tree for the species being
analysed and maps the gene duplication events from the gene trees to
branches in the species tree. OrthoFinder also provides comprehensive
statistics for comparative genomic analyses.

Version 3 defaults changed from version 2: gene trees are now inferred from
multiple sequence alignments by default (-M msa), aligned with FAMSA (-A famsa)
and inferred with FastTree (-T fasttree). Species trees may use ASTRAL-Pro.
Results are therefore not directly comparable with orthofinder/2.5.x.

The following commands are available:
  orthofinder, primary_transcript, make_ultrametric,
  convert_orthofinder_tree_ids, create_hog_fastas, ncbi_primary_transcript,
  orthogroup_gene_count

Example
=======
  ml biocontainers orthofinder/3.1.5
  orthofinder -f proteomes -o results -t ${SLURM_CPUS_ON_NODE} -a 4

Notes
=====
 - -t sets threads for DIAMOND and tree inference; -a sets threads for the
   OrthoFinder algorithm itself and is the memory-intensive one. Start with
   -a equal to about a quarter of -t.
 - Bundled dependency versions: diamond 2.0.13, famsa 2.2.3, FastTree 2.1.11,
   mcl 14-137, mafft 7.511, fastme 2.1.x, astral-pro.
 - A test dataset is included in the image at /opt/orthofinder/ExampleData
   The image is read-only, so -o is required when running against it:
     orthofinder -f /opt/orthofinder/ExampleData -o ./of_test -t 8 -a 2

Performance
===========
OrthoFinder writes thousands of small alignment and tree files, and on shared
scratch this dominates runtime. The bundled 4-species test dataset takes
1326 s writing to /scratch versus 15 s writing to $TMPDIR on the same node,
an 86x difference. DIAMOND is unaffected; the cost is in the alignment, tree
and results-writing stages, and it scales with orthogroup count rather than
species count.

Run in node-local storage and copy results back:

  WORK=$TMPDIR/of_$SLURM_JOB_ID
  mkdir -p $WORK/input
  cp -r /path/to/proteomes/. $WORK/input/
  orthofinder -f $WORK/input -o $WORK/results -t $SLURM_CPUS_ON_NODE -a 4
  rsync -a $WORK/results/ /path/to/final/results/

$TMPDIR is purged when the job completes, so the copy back is not optional.
It is also node-local /tmp shared with any other jobs running on the same
node, so check available space with "df -h $TMPDIR" before a large run.

For long runs, add "#SBATCH --signal=B:TERM@300" and a trap so partial results
are salvaged if the job hits its walltime:

  rescue() { rsync -a "$WORK/results/" /path/to/final/results/; }
  trap rescue TERM EXIT

More information
================
 - Container:     https://hub.docker.com/r/arnstrm2/orthofinder
 - Home page:     https://orthofinder.github.io/OrthoFinder/
 - Source:        https://github.com/OrthoFinder/OrthoFinder
]==])

whatis("Name: OrthoFinder")
whatis("Version: 3.1.5")
whatis("Description: OrthoFinder is a fast, accurate and comprehensive platform for comparative genomics. It finds orthogroups and orthologs, infers rooted gene trees for all orthogroups and identifies all of the gene duplication events in those gene trees. It also infers a rooted species tree for the species being analysed and maps the gene duplication events from the gene trees to branches in the species tree. OrthoFinder also provides comprehensive statistics for comparative genomic analyses.")
whatis("Container: https://hub.docker.com/r/arnstrm2/orthofinder")
whatis("Home page: https://orthofinder.github.io/OrthoFinder/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "OrthoFinder")

local image = "arnstrm2_orthofinder:3.1.5.sif"
local uri = "docker://arnstrm2/orthofinder:3.1.5"
local programs = {
   "orthofinder",
   "primary_transcript",
   "make_ultrametric",
   "convert_orthofinder_tree_ids",
   "create_hog_fastas",
   "ncbi_primary_transcript",
   "orthogroup_gene_count",
}
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
-- OrthoFinder is CPU-only; kept for template consistency.
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

-- And assemble container command.
-- PYTHONPATH / PYTHONHOME from the host (conda, virtualenvs, other modules)
-- would be inherited by the container and shadow the numpy/scipy inside
-- /opt/venv, so they are stripped for this call only.
local env_scrub = "env -u PYTHONPATH -u PYTHONHOME -u PYTHONSTARTUP -u PYTHONUSERBASE "
local container_launch = env_scrub .. singularity .. " run " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
