.. _backbone-label:

Frequently Asked Questions
================================


**What are the advantages of using biocontainers**
  Biocontainers are based on the popular container techonlogy. Due to their ease of deployment and portability, RCAC can deploy a large number of bioinformatic applications on our clusters, and keep adding newer versions. In addition, containerized applications can help improve reproductivity of scientists’ research. Using biocontainers, you can generate the same results no matter which cluster you are using, and no matter whether you run the program today or 10 years later. 

**Can we use both bioinfo and biocontainers in our job script?**
  No. If you load bioinfo, you will find that you cannot load biocontainers. This is a legacy issue, and all clusters are affected except Bell. So you can use either bioinfo or biocontainers in your job script, just do not use both. 

**How should I load biocontainers after I load bioinfo? The error message shows "biocontainers" is unknown.**
  Run below commands:
   - module purge
   - module load modtree/new
   - module load biocontainers

**I cannot find the path to executables by** ``which`` **?**
  Biocontainers' exectuables are located inside containers instead of the host system of cluster. The commands we provide are actually alias to ``singularity exec /apps/biocontainers/images/image.sif command``. For example, the ``blastp`` command you use is actually ``singularity exec /apps/biocontainers/images/blast.sif blastp``. For applications requiring users to provide exectuable path such as ``RSEM`` and ``MAKER``, please check their specific user guides we provide. 
