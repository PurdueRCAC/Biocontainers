Three helper scripts were created to simplify the creation of local Singularity images and Lmod modulefiles generation:
1.  `bioc_pull2sif.sh` is a wrapper around singularity pull,anditoutputsimagenamesthat have been custom-tuned to match our naming convention that follows the convention set by environment modules
of NGC containers.
2. `bioc_pull2mod.sh` is used to generate a draft Lmod modulefile from a container URI.
3. `bioc_pull_and_module.sh` is a simple wrapper combining the first two scripts. Given a container URI, it will pull the container image and generate its modulefile.

Although the helper script `bioc_pull2mod.sh` generates the bulk of Lmod modulefiles, system administrators still need to manually edit/add essential information to these draft modulefiles, including:

- Application name, description, and home page URL
- Conflicting modules
- entrypoint_args, such as env LANG=C
- Executables provided by applications
- MPI support for certain applications
- Custom environment variables and other settings (e.g.dataset locations) that an application may require
