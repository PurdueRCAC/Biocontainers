# Purdue RCAC Biocontainer 

Since 2021, Purdue Research Computing team began to deploy containerized scientific applications on Purdue HPC clusters as well as ACCESS Anvil. Among them, 
**Biocontainer** is a collection of applications for bioinformatic analysis. Thanks to the portability of containerized applications, biocontainer modules can be easily deployed on Anvil and Purdue RCAC's 6 clusters. The number of biocontainer applications grows fast. Within 6 months since we initiated this project, the number of fully tested and deployed bioinformatic applications exceeded 300, and is estimated to reach 600-800 by the end of 2022. 

It is worth to mention that before deploying the modules into production, system administrators also use them to run real-world datasets to make sure the applications work as expected. This is a time-consuming step, but it is quite essential, because our tests revealed that some public containers failed to work due to various kinds of issues. For such flawed containers, we built our own container images from scratch instead. 

We believe these tested biocontainer applications are valuable resources not only to Purdue HPC users, but also to users from other HPC centers. We are happy to share these resources with other centers. Migrating these biocontainer applications to other centers will be pretty easy. If you have interest in this, feel free to contact me(Yucheng Zhang) at: zhan4429@purdue.edu. 

## Documentation

Documentation is available at https://biocontainer-doc.readthedocs.io/en/latest/.

## Contributors

The people who contributed to this project over time:

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/zhan4429"><img src="https://avatars.githubusercontent.com/u/90942318" width="100px;" alt=""/><br /><sub><b>Yucheng Zhang</b></sub></a><br /></td>  
    <td align="center"><a href="https://github.com/lgorenstein"><img src="https://avatars.githubusercontent.com/u/29085518" width="100px;" alt=""/><br /><sub><b>Lev Gorenstein</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/PayasBhutra"><img src="https://avatars.githubusercontent.com/u/70447330" width="100px;" alt=""/><br /><sub><b>Payas Bhutra</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/rderue"><img src="https://avatars.githubusercontent.com/u/38140816" width="100px;" alt=""/><br /><sub><b>Ryan DeRue</b></sub></a><br /></td>
  </tr>
</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

Contributions are welcome in the form of suggestions for additional features, pull requests with new features or bug fixes, etc. If you find bugs or have questions, open an Issue here. If and when the project grows, a code of conduct will be provided along side a more comprehensive set of guidelines for contributing; until then, just be nice.

## Citation
- Zhang, Yucheng, and Lev Gorenstein. "BioContainers on Purdue Clusters." Practice and Experience in Advanced Research Computing. 2022. 1-2. 
  https://dl.acm.org/doi/abs/10.1145/3491418.3535152
- Y. Zhang, L. Gorenstein, P. Bhutra and R. T. DeRue, "Containerized Bioinformatics Ecosystem for HPC," 2022 IEEE/ACM International Workshop on HPC User Support Tools (HUST), Dallas, TX, USA, 2022, pp. 1-10, doi: 10.1109/HUST56722.2022.00006.
