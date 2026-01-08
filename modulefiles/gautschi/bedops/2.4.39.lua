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
Bedops is a software package for manipulating and analyzing genomic interval data. 

More information
================
 - BioContainers: https://biocontainers.pro/tools/bedops
 - Home page:     https://bedops.readthedocs.io/en/latest/
]==])

whatis("Name: Bedops")
whatis("Version: 2.4.39")
whatis("Description: Bedops is a software package for manipulating and analyzing genomic interval data.")
whatis("BioContainers: https://biocontainers.pro/tools/bedops")
whatis("Home page:    https://bedops.readthedocs.io/en/latest/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "quay.io_biocontainers_bedops:2.4.39--h7d875b9_1.sif"
local uri = "docker://quay.io/biocontainers/bedops:2.4.39--h7d875b9_1"
local programs = {"bam2bed", "bam2bed-float128", "bam2bed_gnuParallel", "bam2bed_gnuParallel-float128", "bam2bed_gnuParallel-megarow", "bam2bed_gnuParallel-typical", "bam2bed-megarow", "bam2bed_sge", "bam2bed_sge-float128", "bam2bed_sge-megarow", "bam2bed_sge-typical", "bam2bed_slurm", "bam2bed_slurm-float128", "bam2bed_slurm-megarow", "bam2bed_slurm-typical", "bam2bed-typical", "bam2starch", "bam2starch-float128", "bam2starch_gnuParallel", "bam2starch_gnuParallel-float128", "bam2starch_gnuParallel-megarow", "bam2starch_gnuParallel-typical", "bam2starch-megarow", "bam2starch_sge", "bam2starch_sge-float128", "bam2starch_sge-megarow", "bam2starch_sge-typical", "bam2starch_slurm", "bam2starch_slurm-float128", "bam2starch_slurm-megarow", "bam2starch_slurm-typical", "bam2starch-typical", "bedextract", "bedextract-float128", "bedextract-megarow", "bedextract-typical", "bedmap", "bedmap-float128", "bedmap-megarow", "bedmap-typical", "bedops", "bedops-float128", "bedops-megarow", "bedops-typical", "closest-features", "closest-features-float128", "closest-features-megarow", "closest-features-typical", "convert2bed", "convert2bed-float128", "convert2bed-megarow", "convert2bed-typical", "gff2bed", "gff2bed-float128", "gff2bed-megarow", "gff2bed-typical", "gff2starch", "gff2starch-float128", "gff2starch-megarow", "gff2starch-typical", "gtf2bed", "gtf2bed-float128", "gtf2bed-megarow", "gtf2bed-typical", "gtf2starch", "gtf2starch-float128", "gtf2starch-megarow", "gtf2starch-typical", "gvf2bed", "gvf2bed-float128", "gvf2bed-megarow", "gvf2bed-typical", "gvf2starch", "gvf2starch-float128", "gvf2starch-megarow", "gvf2starch-typical", "psl2bed", "psl2bed-float128", "psl2bed-megarow", "psl2bed-typical", "psl2starch", "psl2starch-float128", "psl2starch-megarow", "psl2starch-typical", "rmsk2bed", "rmsk2bed-float128", "rmsk2bed-megarow", "rmsk2bed-typical", "rmsk2starch", "rmsk2starch-float128", "rmsk2starch-megarow", "rmsk2starch-typical", "sam2bed", "sam2bed-float128", "sam2bed-megarow", "sam2bed-typical", "sam2starch", "sam2starch-float128", "sam2starch-megarow", "sam2starch-typical", "sort-bed", "sort-bed-float128", "sort-bed-megarow", "sort-bed-typical", "starch", "starchcat", "starchcat-float128", "starchcat-megarow", "starchcat-typical", "starchcluster_gnuParallel", "starchcluster_gnuParallel-float128", "starchcluster_gnuParallel-megarow", "starchcluster_gnuParallel-typical", "starchcluster_sge", "starchcluster_sge-float128", "starchcluster_sge-megarow", "starchcluster_sge-typical", "starchcluster_slurm", "starchcluster_slurm-float128", "starchcluster_slurm-megarow", "starchcluster_slurm-typical", "starch-diff", "starch-diff-float128", "starch-diff-megarow", "starch-diff-typical", "starch-float128", "starch-megarow", "starchstrip", "starchstrip-float128", "starchstrip-megarow", "starchstrip-typical", "starch-typical", "switch-BEDOPS-binary-type", "unstarch", "unstarch-float128", "unstarch-megarow", "unstarch-typical", "update-sort-bed-migrate-candidates", "update-sort-bed-migrate-candidates-float128", "update-sort-bed-migrate-candidates-megarow", "update-sort-bed-migrate-candidates-typical", "update-sort-bed-slurm", "update-sort-bed-slurm-float128", "update-sort-bed-slurm-megarow", "update-sort-bed-slurm-typical", "update-sort-bed-starch-slurm", "update-sort-bed-starch-slurm-float128", "update-sort-bed-starch-slurm-megarow", "update-sort-bed-starch-slurm-typical", "vcf2bed", "vcf2bed-float128", "vcf2bed-megarow", "vcf2bed-typical", "vcf2starch", "vcf2starch-float128", "vcf2starch-megarow", "vcf2starch-typical", "wig2bed", "wig2bed-float128", "wig2bed-megarow", "wig2bed-typical", "wig2starch", "wig2starch-float128", "wig2starch-megarow", "wig2starch-typical"}
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
