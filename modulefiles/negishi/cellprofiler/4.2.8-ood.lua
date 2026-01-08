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
CellProfiler is a free open-source software designed to enable biologists without training in computer vision or programming to quantitatively measure phenotypes from thousands of images automatically.

More information
================
 - BioContainers: https://biocontainers.pro/tools/cellprofiler
 - Home page:      https://cellprofiler.org/
]==])

whatis("Name: Cellprofiler")
whatis("Version: 4.2.8")
whatis("Description: CellProfiler is a free open-source software designed to enable biologists without training in computer vision or programming to quantitatively measure phenotypes from thousands of images automatically.")
whatis("BioContainers: https://biocontainers.pro/tools/cellprofiler")
whatis("Home page:      https://cellprofiler.org/")

conflict(myModuleName())

local image = "quay.io_biocontainers_cellprofiler:4.2.8--pyhdfd78af_0.sif"
local uri = "docker://quay.io/biocontainers/cellprofiler:4.2.8--pyhdfd78af_0"
local entrypoint_args = ""

local apptainer = capture("which apptainer | head -c -1")

if (os.getenv("BIOC_IMAGE_DIR")) then
    image = pathJoin(os.getenv("BIOC_IMAGE_DIR"), image)
    if not (isFile(image)) then
        if (mode() == "load") then
            LmodMessage("file not found: " .. image)
            LmodMessage("The container image will be pulled upon first use to the Apptainer cache")
        end
        image = uri
    end
else
    image = uri
end

-- Determine Nvidia and/or AMD GPUs (to pass corresponding flag to Apptainer)
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

-- And assemble container commands
local common_args = table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- 1. Setup GUI command: cellprofiler
--    This version includes the --x11 flag for display forwarding.
local gui_launch = apptainer .. " exec " .. common_args
set_shell_function("cellprofiler", gui_launch .. " cellprofiler \"$@\"",
                                 gui_launch .. " cellprofiler $*")

-- 2. Setup headless command: cellprofiler-headless
--    This version omits --x11 and calls the python module directly.
local headless_launch = apptainer .. " exec " .. common_args
set_shell_function("cellprofiler-headless", headless_launch .. " python -m cellprofiler \"$@\"",
                                            headless_launch .. " python -m cellprofiler $*")

-- Environment variable for the Java library path
pushenv("APPTAINERENV_LD_LIBRARY_PATH", "/usr/local/lib/jvm/lib/server")
