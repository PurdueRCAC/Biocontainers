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
AWS CLI v2 is the unified command-line tool from Amazon Web Services for
managing AWS services and resources, including S3 object storage, IAM, EC2,
and many others. This container provides the official AWS CLI v2 image.

Quick start
===========
   module load biocontainers
   module load aws-cli
   aws --version
   aws s3 ls s3://1000genomes/ --no-sign-request | head

More information
================
 - Home page:   https://aws.amazon.com/cli/
 - Source:      https://github.com/aws/aws-cli
 - Image:       public.ecr.aws/aws-cli/aws-cli
]==])

whatis("Name: aws-cli")
whatis("Version: 2.34.39")
whatis("Description: AWS Command Line Interface v2 (official Amazon image)")
whatis("Home page:   https://aws.amazon.com/cli/")
whatis("Source:      https://github.com/aws/aws-cli")
whatis("Image:       public.ecr.aws/aws-cli/aws-cli")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

local image = "aws-cli-2.34.39.sif"
local uri = "docker://public.ecr.aws/aws-cli/aws-cli:2.34.39"
local programs = {"aws", "aws_completer"}
local entrypoint_args = ""

-- The absolute path to Singularity is needed so it can be invoked on remote
-- nodes without the corresponding module necessarily being loaded.
local singularity = capture("which singularity | head -c -1")

if (os.getenv("BIOC_IMAGE_DIR")) then
   image = pathJoin(os.getenv("BIOC_IMAGE_DIR"), image)

   if not (isFile(image)) then
      if (mode() == "load") then
         LmodMessage("file not found: " .. image)
         LmodMessage("The container image will be pulled upon first use to the Singularity cache")
      end
      image = uri
   end
else
   image = uri
end

-- Determine Nvidia and/or AMD GPUs (no-op for aws-cli but kept for template parity)
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

-- Rossmann proxy passthrough. Variables are expanded by the shell at command
-- invocation time, so updates to the cluster proxy do not require a rebuild.
local proxy_args = '--env HTTPS_PROXY="$https_proxy" --env HTTP_PROXY="$http_proxy" --env NO_PROXY="$no_proxy"'

-- Assemble container command
local container_launch = singularity .. " exec " .. proxy_args .. " " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- Expose wrappers on PATH for non-bash contexts (Perl, Python, Nextflow, etc.)
local wrapper_dir = pathJoin("/apps/biocontainers/exported-wrappers", myModuleName(), myModuleVersion())
if (isDir(wrapper_dir)) then
   prepend_path("PATH", wrapper_dir)
end

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Optional warning when loaded on a compute node (Rossmann compute has no egress).
-- Soft warn only; do not block, in case of designated transfer hosts.
if (mode() == "load") then
   local hostname = capture("hostname -s | head -c -1")
   if not (string.match(hostname, "^login")) then
      LmodMessage("BIOC: Note: aws-cli requires internet access. Rossmann compute nodes")
      LmodMessage("BIOC: do not have outbound egress. Run AWS CLI commands from a login node.")
   end
end
