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
Rockhopper is a system for computational analysis of bacterial RNA-seq data.
It takes FASTQ, QSEQ, FASTA, SAM or BAM reads and performs read alignment,
reference-based or de novo transcript assembly, transcript boundary and
novel transcript (e.g. sRNA) detection, normalization, quantification,
differential expression testing and operon prediction, with a built-in
genome browser. All analysis is self-contained in a single Java jar; no
external aligners are required.

This module provides one command, available as either "Rockhopper" or
"rockhopper":
  Rockhopper              launches the graphical interface (requires a display)
  Rockhopper <options>    runs Rockhopper in command-line mode
  Rockhopper -h           prints command-line options

Running the graphical interface (GUI)
=====================================
The GUI needs an X display and should run on a compute node, not a login or
ThinLinc front-end node, since alignment is CPU and memory intensive.

Option 1 (recommended): Open OnDemand desktop
  1. Log in to the cluster's Open OnDemand portal (https://gateway.<cluster>.rcac.purdue.edu).
  2. Launch the Desktop interactive app with the cores and walltime you need.
  3. Open a terminal in the desktop session and run:
       module --force purge
       module load biocontainers rockhopper/2.0.3
       cd $RCAC_SCRATCH/my_project
       Rockhopper

Option 2: SSH with X11 forwarding
  1. Connect with X11 forwarding (macOS needs XQuartz; Windows needs an
     X server such as MobaXterm):
       ssh -Y <username>@<cluster>.rcac.purdue.edu
  2. Request an interactive job on a compute node with X11 enabled:
       sinteractive -A <account> -N 1 -n 8 -t 02:00:00
     (or: srun -A <account> -N 1 -n 8 -t 02:00:00 --x11 --pty bash)
  3. Load the module and start the GUI as in Option 1.
  X11 forwarding over SSH can be slow for the genome browser; Option 1 is
  usually more responsive.

Running in command-line mode (batch jobs)
=========================================
For multi-sample experiments, command-line mode in a Slurm batch job is more
reproducible and is not lost if an interactive session ends. Run
"Rockhopper -h" for the full option list.

Read files are positional arguments:
  - replicates of one condition are comma-separated
  - conditions are separated by spaces
  - mates of a paired-end library are joined with '%'
  - differential expression is tested between condition pairs 1 vs 2,
    3 vs 4, ..., so order conditions accordingly

Reference-based vs de novo:
  - With -g, reads are aligned to the genome(s). Each -g directory must
    contain a genome FASTA (*.fna), protein-coding gene table (*.ptt) and
    RNA gene table (*.rnt). The command line does NOT download genomes from
    GenBank the way the GUI does; you must supply these files.
  - WITHOUT -g, Rockhopper silently runs de novo transcript assembly.

Commonly used options:
  -p <int>       number of processors (match the cores requested)
  -s <bool>      strand-specific library (default true; set -s false for
                 unstranded libraries)
  -ff/fr/rf/rr   mate orientation for paired-end reads (default fr)
  -L <a,b,...>   condition labels
  -o <dir>       output directory (default Rockhopper_Results/)
  -v true        verbose output with raw/normalized counts per gene
  -SAM           also write alignments as SAM

Example: reference-based, paired-end, two conditions x two replicates

  #!/bin/bash
  #SBATCH -A <account>
  #SBATCH -N 1
  #SBATCH -n 16
  #SBATCH -t 12:00:00
  module --force purge
  module load biocontainers rockhopper/2.0.3
  export ROCKHOPPER_XMX=32g
  Rockhopper -p 16 -s true -g genome_dir -o rockhopper_out -L control,treated \
      ctrl1_R1.fastq.gz%ctrl1_R2.fastq.gz,ctrl2_R1.fastq.gz%ctrl2_R2.fastq.gz \
      trt1_R1.fastq.gz%trt1_R2.fastq.gz,trt2_R1.fastq.gz%trt2_R2.fastq.gz

Example: de novo, single-end (no -g)

  Rockhopper -p 16 -o rockhopper_denovo -L control,treated \
      ctrl1.fastq.gz,ctrl2.fastq.gz trt1.fastq.gz,trt2.fastq.gz

For de novo runs, raising the k-mer hashtable size (-n 26) needs a larger
Java heap (ROCKHOPPER_XMX).

Java memory
===========
The Java heap defaults to 8 GB. Override it before running:
  export ROCKHOPPER_XMX=32g
Keep this below the memory available to your job (memory is allocated in
proportion to the cores requested). Additional JVM flags can be passed with
ROCKHOPPER_JAVA_OPTS.

Notes
=====
 - Rockhopper writes results to the directory it is started from (or to -o),
   so start it from your scratch or depot space rather than $HOME.
 - If the GUI reports "no DISPLAY set", you are not in an OOD desktop or an
   X11-forwarded session.

More information
================
 - Home page:   http://cs.wellesley.edu/~btjaden/Rockhopper/
 - Source:      https://github.com/btjaden/Rockhopper
 - Citation:    McClure R, et al. Computational analysis of bacterial RNA-Seq
                data. Nucleic Acids Res. 2013;41(14):e140.
]==])

whatis("Name: Rockhopper")
whatis("Version: 2.0.3")
whatis("Description: Rockhopper is a GUI and command-line system for bacterial RNA-seq analysis: alignment, transcript assembly, quantification, differential expression and operon prediction.")
whatis("Home page: http://cs.wellesley.edu/~btjaden/Rockhopper/")
whatis("Source: https://github.com/btjaden/Rockhopper")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

local image = "arnstrm2_rockhopper:2.0.3.sif"
local uri = "docker://arnstrm2/rockhopper:2.0.3"
local programs = {"Rockhopper", "rockhopper"}
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
   end
else
   -- Look for the image in the Singularity cache, and if not found
   -- download it when "singularity run" is invoked.
   image = uri
end

-- Rockhopper is CPU-only; no GPU flags are passed to the container.
local container_launch = singularity .. " exec " .. image .. " " .. entrypoint_args

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
if (mode() == "load") then
   LmodMessage("Rockhopper: run 'Rockhopper' with no arguments from an OOD Desktop or X11 session for the GUI,")
   LmodMessage("or 'Rockhopper -h' for command-line options. See 'module help rockhopper/2.0.3'.")
end
