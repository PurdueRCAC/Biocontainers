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
Emboss is "The European Molecular Biology Open Software Suite".

More information
================
 - BioContainers: https://biocontainers.pro/tools/emboss
 - Home page:  http://emboss.open-bio.org
]==])

whatis("Name: Emboss")
whatis("Version: 6.6.0")
whatis("Description: Emboss is 'The European Molecular Biology Open Software Suite'")
whatis("BioContainers: https://biocontainers.pro/tools/emboss")
whatis("Home page:     http://emboss.open-bio.org")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(),"EMBOSS")

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "quay.io_biocontainers_emboss:6.6.0--h8719169_4.sif"
local uri = "docker://quay.io/biocontainers/emboss:6.6.0--h8719169_4"
local programs = {"aaindexextract", "abiview", "acdc", "acdgalaxy", "acdlog", "acdpretty", "acdtable", "acdtrace", "acdvalid", "aligncopy", "aligncopypair", "antigenic", "assemblyget", "backtranambig", "backtranseq", "banana", "biosed", "btwisted", "cachedas", "cachedbfetch", "cacheebeyesearch", "cacheensembl", "cai", "chaos", "charge", "checktrans", "chips", "cirdna", "codcmp", "codcopy", "coderet", "compseq", "cons", "consambig", "cpgplot", "cpgreport", "cusp", "cutgextract", "cutseq", "dan", "dbiblast", "dbifasta", "dbiflat", "dbigcg", "dbtell", "dbxcompress", "dbxedam", "dbxfasta", "dbxflat", "dbxgcg", "dbxobo", "dbxreport", "dbxresource", "dbxstat", "dbxtax", "dbxuncompress", "degapseq", "density", "descseq", "diffseq", "distmat", "dotmatcher", "dotpath", "dottup", "dreg", "drfinddata", "drfindformat", "drfindid", "drfindresource", "drget", "drtext", "edamdef", "edamhasinput", "edamhasoutput", "edamisformat", "edamisid", "edamname", "edialign", "einverted", "embossdata", "embossupdate", "embossversion", "emma", "emowse", "entret", "epestfind", "eprimer3", "eprimer32", "equicktandem", "est2genome", "etandem", "extractalign", "extractfeat", "extractseq", "featcopy", "featmerge", "featreport", "feattext", "findkm", "freak", "fuzznuc", "fuzzpro", "fuzztran", "garnier", "geecee", "getorf", "godef", "goname", "helixturnhelix", "hmoment", "iep", "infoalign", "infoassembly", "infobase", "inforesidue", "infoseq", "isochore", "jaspextract", "jaspscan", "jembossctl", "lindna", "listor", "makenucseq", "makeprotseq", "marscan", "maskambignuc", "maskambigprot", "maskfeat", "maskseq", "matcher", "megamerger", "merger", "msbar", "mwcontam", "mwfilter", "needle", "needleall", "newcpgreport", "newcpgseek", "newseq", "nohtml", "noreturn", "nospace", "notab", "notseq", "nthseq", "nthseqset", "octanol", "oddcomp", "ontocount", "ontoget", "ontogetcommon", "ontogetdown", "ontogetobsolete", "ontogetroot", "ontogetsibs", "ontogetup", "ontoisobsolete", "ontotext", "palindrome", "pasteseq", "patmatdb", "patmatmotifs", "pepcoil", "pepdigest", "pepinfo", "pepnet", "pepstats", "pepwheel", "pepwindow", "pepwindowall", "plotcon", "plotorf", "polydot", "preg", "prettyplot", "prettyseq", "primersearch", "printsextract", "profit", "prophecy", "prophet", "prosextract", "pscan", "psiphi", "rebaseextract", "recoder", "redata", "refseqget", "remap", "restover", "restrict", "revseq", "runJemboss.sh", "seealso", "seqcount", "seqmatchall", "seqret", "seqretsetall", "seqretsplit", "seqxref", "seqxrefget", "servertell", "showalign", "showdb", "showfeat", "showorf", "showpep", "showseq", "showserver", "shuffleseq", "sigcleave", "silent", "sirna", "sixpack", "sizeseq", "skipredundant", "skipseq", "splitsource", "splitter", "stretcher", "stssearch", "supermatcher", "syco", "taxget", "taxgetdown", "taxgetrank", "taxgetspecies", "taxgetup", "tcode", "textget", "textsearch", "tfextract", "tfm", "tfscan", "tmap", "tranalign", "transeq", "trimest", "trimseq", "trimspace", "twofeat", "union", "urlget", "variationget", "vectorstrip", "water", "whichdb", "wobble", "wordcount", "wordfinder", "wordmatch", "wossdata", "wossinput", "wossname", "wossoperation", "wossoutput", "wossparam", "wosstopic", "xmlget", "xmltext", "yank"}
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
