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
sRNAtoolbox is a collection of tools for small RNA research: expression
profiling and novel miRNA prediction (sRNAbench), differential expression
(sRNAde), analysis of unmapped reads with BLAST (sRNAblast), consensus
miRNA target prediction (miRNAconsTargets), and degradome analysis
(sRNAdegradome).

This build uses the sRNAtoolbox GitHub jars at commit 2e812f7 (2023-01-16;
sRNAbench and sRNAde 2.1, 04/2022), the database libraries and R scripts
from the upstream ugrbioinfo/srnatoolbox:0.0.6 image, and dependencies
from Bioconda: bowtie 1.3.1, samtools 1.21, BLAST+ 2.16.0, ViennaRNA 2.6.4,
miRanda 3.3a, FastQC 0.12.1, sra-tools 3.1.1, OpenJDK 11, and R 4.3 with
DESeq2, edgeR, and NOISeq.

Commands
========
Each tool is a Java jar in the container, exposed as a shell function:
  sRNAbench, sRNAde, sRNAblast, sRNAdegradome, sRNAhelper,
  miRNAconsTargets, miRgFree, MiRor, detectSpecies, makeSeqObj,
  makeTargetPositionalConsensus

Run any command without arguments to print its usage.

Usage
=====
Arguments use the upstream key=value syntax. Use absolute paths for
input= and output=. Always set output=; the default location inside the
container is read-only.

Library-only profiling (no genome):
  sRNAbench input=$PWD/reads.fq.gz output=$PWD/sb_out microRNA=hsa \
            adapter=TGGAATTCTCGGGTGCCAAGG p=$SLURM_CPUS_PER_TASK

Genome mode with your own database copy:
  1. Copy the bundled database to a writable location (one time):
       mkdir -p /depot/<lab>/srnatoolboxDB
       singularity exec $SRNATOOLBOX_IMAGE cp -r /opt/sRNAtoolboxDB/. /depot/<lab>/srnatoolboxDB/
  2. Build a bowtie 1.x index (not bowtie2) into its index/ folder:
       singularity exec $SRNATOOLBOX_IMAGE bowtie-build --threads 8 genome.fa \
            /depot/<lab>/srnatoolboxDB/index/<name>
  3. Run with dbPath= and species=<name>:
       sRNAbench dbPath=/depot/<lab>/srnatoolboxDB species=<name> \
            input=$PWD/reads.fq.gz output=$PWD/sb_out microRNA=<code> \
            p=$SLURM_CPUS_PER_TASK

Environment
===========
  SRNATOOLBOX_DB         Default database directory; used automatically,
                         dbPath= overrides it.
  SRNATOOLBOX_EXEC       Directory of the jar files inside the container
  SRNATOOLBOX_IMAGE      Container image used by this module
  SRNATOOLBOX_BLASTDB    RCAC shared NCBI BLAST databases (also set as
                         BLASTDB inside the container)
  SRNATOOLBOX_JAVA_OPTS  Optional JVM options, set by the user before
                         calling a tool, e.g. export SRNATOOLBOX_JAVA_OPTS="-Xmx16g"

Notes
=====
 - The bundled database (miRBase, MirGeneDB, PmiREN, miRCarta) dates
   from February 2023 and is read-only. No genome indexes are bundled.
   The upstream database update service is no longer available.
 - sRNAblast: the upstream default blastDB=nr is a protein database and
   does not work with blastn. Always pass a nucleotide database:
   blastDB=core_nt (recommended; smaller and faster), blastDB=nt, or
   blastDB=/path/to/your_db. Shared databases are refreshed monthly;
   see $SRNATOOLBOX_BLASTDB/MANIFEST.tsv for versions.
     sRNAblast input=$PWD/reads.fq.gz output=$PWD/blast_out blastDB=core_nt \
               maxReads=500 p=$SLURM_CPUS_PER_TASK
 - SRA accessions as input= need outbound internet access from the
   compute node; local FASTQ files are recommended.
 - miRNAconsTargets: miRanda (MIRANDA), PITA, and SEED methods are
   available. TargetSpy (TS) and the plant target tools (psRobot, TAPIR)
   are not included.
 - Java heap: OpenJDK 11 sizes the default heap from the job's memory
   allocation. Raise it with SRNATOOLBOX_JAVA_OPTS for large datasets.

More information
================
 - Docker Hub:     https://hub.docker.com/r/arnstrm2/srnatoolbox
 - Upstream image: https://hub.docker.com/r/ugrbioinfo/srnatoolbox
 - Home page:      https://arn.ugr.es/srnatoolbox
 - Source:         https://github.com/bioinfoUGR/sRNAtoolbox
 - Citation:       Aparicio-Puerta et al. (2022) Nucleic Acids Res 50(W1):W710-W717
                   https://doi.org/10.1093/nar/gkac363
]==])

whatis("Name: sRNAtoolbox")
whatis("Version: 2023.01.16")
whatis("Description: sRNAtoolbox is a collection of tools for small RNA expression profiling, differential expression, target prediction, and degradome analysis.")
whatis("Docker Hub: https://hub.docker.com/r/arnstrm2/srnatoolbox")
whatis("Home page:     https://arn.ugr.es/srnatoolbox")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

local image = "arnstrm2_srnatoolbox:2023.01.16.sif"
local uri = "docker://arnstrm2/srnatoolbox:2023.01.16"
-- Each tool is a launcher in /usr/local/bin inside the image:
--   exec java ${SRNATOOLBOX_JAVA_OPTS:-} -jar /opt/sRNAtoolboxDB/exec/<tool>.jar
-- Not exposed on purpose: bowtie, samtools, blastn, RNAfold, Rscript, fastqc,
-- miranda, perl, python3 (internal dependencies; would shadow users' modules),
-- and miRNAconsTargets_plants.py (psRobot/TAPIR not in the image).
local programs = {
   "sRNAbench",
   "sRNAde",
   "sRNAblast",
   "sRNAdegradome",
   "sRNAhelper",
   "miRNAconsTargets",
   "miRgFree",
   "MiRor",
   "detectSpecies",
   "makeSeqObj",
   "makeTargetPositionalConsensus",
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

-- Shared database copy (with genome indexes) if staged;
-- otherwise fall back to the read-only copy inside the image.
local db_host = "/depot/itap/datasets/srnatoolbox/current/sRNAtoolboxDB"
local db_path = "/opt/sRNAtoolboxDB"
if (isDir(db_host)) then
   table.insert(run_args, "--bind " .. db_host)
   db_path = db_host
end

-- RCAC shared NCBI BLAST databases for sRNAblast (blastDB=core_nt).
-- BLASTDB lets blastn resolve a bare database name such as core_nt.
-- `latest` is a relative symlink to a week-WW-YYYY snapshot, so the parent
-- directory is bound at the same path to keep it resolvable in the container.
local blast_host = "/depot/datasets/bioinformatics/blast/latest"
if (isDir(blast_host)) then
   table.insert(run_args, "--bind /depot/datasets/bioinformatics/blast")
   setenv("SRNATOOLBOX_BLASTDB", blast_host)
   setenv("SINGULARITYENV_BLASTDB", blast_host)
   setenv("APPTAINERENV_BLASTDB", blast_host)
end

-- And assemble container command.
-- env -u: drop XALT LD_PRELOAD (glibc mismatch), host R library paths
-- (the container ships its own R 4.3 under /opt/conda), and the host's
-- exported which() bash function (Rocky /etc/profile.d/which2.sh), whose
-- GNU-only flags break the container's which used by sRNAbench.
local host_env_strip = "env -u LD_PRELOAD -u R_LIBS -u R_LIBS_USER -u R_LIBS_SITE -u BASH_FUNC_which%%"
local container_launch = host_env_strip .. " " .. singularity .. " exec " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
setenv("SRNATOOLBOX_DB", db_path)
setenv("SRNATOOLBOX_EXEC", "/opt/sRNAtoolboxDB/exec")
setenv("SRNATOOLBOX_IMAGE", image)
-- The jars read $toolboxDB as the default dbPath. The image sets
-- toolboxDB=/opt/sRNAtoolboxDB; override it inside the container so a
-- staged shared copy is used without dbPath=.
setenv("SINGULARITYENV_toolboxDB", db_path)
setenv("APPTAINERENV_toolboxDB", db_path)
