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
GATK (Genome Analysis Toolkit) is a collection of command-line tools for
analyzing high-throughput sequencing data with a primary focus on variant
discovery.

Notes
=====
Three ways to invoke, all provided by this module:
  gatk <Tool> ...            the standard launcher script
  gatk-jar <Tool> ...        java -jar /gatk/gatk.jar (local jar)
  gatk-spark-jar <Tool> ...  java -jar /gatk/gatk-spark.jar
$GATK_JAR and $GATK_SPARK_JAR hold the in-container jar paths.

Heap: the launcher does not inherit Slurm memory limits. Set it
explicitly and stay under --mem:
  gatk --java-options '-Xmx16g -Xms16g' HaplotypeCaller ...

Scratch: GATK defaults java.io.tmpdir to /tmp, which is node-shared on
Negishi and is a common cause of collisions and out-of-space failures.
Always pass --tmp-dir:
  gatk --java-options '-Djava.io.tmpdir=$TMPDIR' --tmp-dir $TMPDIR ...

This is the Broad-published image, so it also carries the bundled Python
and R environments needed by CNV and NVScoreVariants tools.

More information
================
 - BioContainers: https://biocontainers.pro/tools/gatk4
 - Home page:     https://gatk.broadinstitute.org/
]==])

whatis("Name: GATK")
whatis("Version: 4.6.2.0")
whatis("Description: GATK (Genome Analysis Toolkit) is a collection of command-line tools for analyzing high-throughput sequencing data with a primary focus on variant discovery.")
whatis("BioContainers: https://biocontainers.pro/tools/gatk4")
whatis("Home page:     https://gatk.broadinstitute.org/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "gatk", "GATK", "GATK4")

local image = "broadinstitute_gatk:4.6.2.0.sif"
local uri = "docker://broadinstitute/gatk:4.6.2.0"
local programs = {"gatk"}
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
-- NOTE: "exec" (not "run"). "run" invokes the image runscript/CMD and would
-- pass the program name as an argument to it. Verify per image with:
--   singularity inspect --runscript <image>.sif
local container_launch = singularity .. " exec " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- GATK is invoked two ways in the wild: through the 'gatk' launcher script,
-- and by calling the packaged jar directly. The image ships /gatk/gatk.jar as
-- a stable symlink to gatk-package-<version>-local.jar, so the wrapper below
-- does not need updating on a version bump.
local gatk_jar = "/gatk/gatk.jar"
local gatk_spark_jar = "/gatk/gatk-spark.jar"

setenv("GATK_JAR", gatk_jar)
setenv("GATK_SPARK_JAR", gatk_spark_jar)
setenv("GATK_LOCAL_JAR", gatk_jar)

-- 'gatk-jar <Tool> ...' is equivalent to 'java -jar gatk.jar <Tool> ...'
-- run inside the container. Pass JVM flags via _JAVA_OPTIONS if needed.
set_shell_function("gatk-jar",
                   container_launch .. " java -jar " .. gatk_jar .. " \"$@\"",
                   container_launch .. " java -jar " .. gatk_jar .. " $*")
set_shell_function("gatk-spark-jar",
                   container_launch .. " java -jar " .. gatk_spark_jar .. " \"$@\"",
                   container_launch .. " java -jar " .. gatk_spark_jar .. " $*")

-- Additional commands or environment variables, if any
