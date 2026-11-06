-- biocontainers/braker4/0.5.0-beta.lua  (Negishi, Gautschi)
-- Controller image: docker://arnstrm2/braker4:0.5.0-beta
--   digest sha256:ddd158f9b584c6f909b4ff7cacedc56692f15ad8930976b3e108794f359ae103
-- Upstream: Gaius-Augustus/BRAKER4 tag v0.5.0-beta, commit c72618b
--   (the tag's Snakefile reports 0.4.0-beta; upstream did not bump it)

help([[
BRAKER4 0.5.0-beta: genome annotation with GeneMark, AUGUSTUS and TSEBRA,
implemented in Snakemake (ES, ET, EP, ETP, IsoSeq and dual modes).

Quick start (single node, inside an sbatch job):
  module load biocontainers braker4/0.5.0-beta
  braker4-init                  # writes config.ini and a samples.csv header in $PWD
  # add one row per genome to samples.csv; edit config.ini if needed
  braker4 --cores $SLURM_CPUS_PER_TASK

Notes:
  - All arguments to `braker4` go to Snakemake: `braker4 -n` (dry run),
    `braker4 --unlock`, `braker4 --keep-going`. Re-running resumes.
  - Use the samples.csv header written by braker4-init; it matches this version.
  - Repeat masking default is RepeatModeler2 + RepeatMasker: thorough but slow
    (can take days on genomes >1 Gb; request walltime accordingly). It fails
    on very small or repeat-poor genomes (roughly <20 Mb). Alternatives:
    `masking_tool = red` in config.ini, or a pre-masked genome in genome_masked.
  - Runs on one node; --executor slurm is not supported by this module.
  - BUSCO lineages are shared at /depot/itap/datasets/busco/current
    (eukaryota_odb12). Ask RCAC for others.
  - OrthoDB protein partitions: braker4-download-orthodb <Clade> [outdir]

GeneMark is free for academic use only. Commercial users must license it from
the GeneMark authors (Borodovsky, Lomsadze).
Homepage: https://github.com/Gaius-Augustus/BRAKER4
]])

whatis("Name: braker4")
whatis("Version: 0.5.0-beta")
whatis("Description: Genome annotation workflow (GeneMark + AUGUSTUS + TSEBRA) in Snakemake")
whatis("URL: https://github.com/Gaius-Augustus/BRAKER4")

conflict(myModuleName())
conflict("snakemake")

local root     = "/apps/biocontainers"
local image    = pathJoin(root, "images/arnstrm2_braker4:0.5.0-beta.sif")
local share    = pathJoin(root, "share/braker4/0.5.0-beta")
local programs = { "braker4", "braker4-init", "braker4-download-orthodb" }

-- Read by the launchers inside the image.
setenv("BRAKER4_SITE_CONFIG", pathJoin(share, "config.ini.site"))
-- Inner (tool-container) binds. The image's own apptainer.conf binds only
-- /etc/localtime and /etc/hosts, so data paths must be listed here.
setenv("BRAKER4_BIND", "/home,/scratch,/depot,/apps")

-- Outer binds come from the host apptainer.conf (/depot, /scratch, /apps on
-- Negishi and Gautschi). Add "-B ..." on clusters whose apptainer.conf lacks them.
-- env -u LD_PRELOAD: XALT preload breaks container glibc.
-- -u PYTHONPATH/PYTHONHOME: stop host Python settings leaking into the venv.
local launch = "env -u LD_PRELOAD -u PYTHONPATH -u PYTHONHOME singularity exec " .. image

for _, prog in ipairs(programs) do
    set_shell_function(prog,
        launch .. " " .. prog .. ' "$@"',
        launch .. " " .. prog .. " $*")
end
