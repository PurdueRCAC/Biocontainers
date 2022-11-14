The template directory which is included was originally used for ACCESS Anvil, and as such there are many values that are specific to Anvil which would need to be changed for different systems. The template is provided as an example to guide the design of a template for other sites. Examples of values which are specific to Anvil include:

- Number of cores per node
- Partitions for job submission
- Min/Max walltimes

Additionally, the deploy\_biocontainer script does not supply any additional arguments to the singularity exec call which launches the application in order to keep it general. Applications requiring additional options such as extra bind directories will need to be supplied within the created application directory.
