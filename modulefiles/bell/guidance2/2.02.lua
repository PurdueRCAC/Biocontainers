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

-- TODO: edit name, description, home page URL (in help and whatis)
help([==[

Description
===========
GUIDe Tree Based AligNment ConfidencE (GUIDANCE) is a software package for aligning biological sequences (DNA or amino acids) using either MAFFT, PRANK, or CLUSTALW, and calculating confidence scores for each column, sequence and residue in the alignment.

More information
================
 - BioContainers: https://hub.docker.com/repository/docker/arnstrm2/guidance2/general
 - Home page:     https://taux.evolseq.net/guidancever2/source.php
]==])

whatis("Name: Guidance2")
whatis("Version: 2.02")
whatis("Description: GUIDe Tree Based AligNment ConfidencE (GUIDANCE) is a software package for aligning biological sequences (DNA or amino acids) using either MAFFT, PRANK, or CLUSTALW, and calculating confidence scores for each column, sequence and residue in the alignment.")
whatis("BioContainers: https://hub.docker.com/repository/docker/arnstrm2/guidance2/general")
whatis("Home page:     https://taux.evolseq.net/guidancever2/source.php")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

-- TODO: check module conflicts (think older version, OpenMPI, etc)
conflict(myModuleName())

-- TODO: Add all necessary commands to the programs={} list!
--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "arnstrm2_guidance2:2.02.sif"
local uri = "docker://arnstrm2/guidance2:2.02"
local programs = {"Create_Chimera_Figure_Files_For_ConSurfDB.pl", "Create_PyMol_Files_For_ConSurfDB.pl", "HoT_COS_GUIDANCE2.pl", "Monitor_Bioseq_Node.pl", "Remove_Pos_bellow_Cutoff.pl", "Remove_Seq_bellow_Cutoff.pl", "Replace_B_Factor_With_ConSurf_Grade.pl", "blastpgp_to_fasta.pl", "calculate_statistics.pl", "checkjob.pl", "cluster.pl", "code2nameFasta.pl", "code2nameTree.pl", "colorCoding.v2.pl", "colorCodingLinear.pl", "convertBSTrees2MafftFormat.pl", "convertNacessFormat.pl", "create_MSA_from_blast.pl", "create_chimerx.pl", "create_colored_chimera_msa.pl", "daemon.pl", "extract_info_from_pdb.pl", "failedCheck.pl", "guidance.pl", "isEqualTree", "maskLowScoreResidues.pl", "msa_set_score", "name2codeFastaFrom1.pl", "printColoredAlignment.pl", "pullOutBStrees.pl", "r4s_res_to_gradesPE.pl", "removeLowSPsites.pl", "removeTaxa", "remove_old_results.pl", "rootTree.pl", "runAlignBStrees.pl", "selecton_run_calc.pl", "semphy", "sendEmail.pl", "statTest.pl", "test_time.pl", "update_runTime.pl"}
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

-- TODO: Uncomment or delete these lines (only needed for MPI-enabled programs)
-- Multinode support
-- setenv("OMPI_MCA_orte_launch_agent", container_launch .. " orted")

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
-- append_path("APPTAINER_BIND", "/opt/guidance.v2.02:/guidance", ',')
