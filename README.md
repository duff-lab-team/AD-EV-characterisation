# AD EV Characterisation
#### This analysis is complete and should not see major updates
#### Characterisation of fractionated extracellular vesicles in Alzheimer's Disease

```
This file is part of AD-EV-characterisation.
Copyright (C) 2022  Emir Turkes, Stephanie Fowler, UK DRI at UCL, Columbia
University Medical Center

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Emir Turkes can be contacted at emir.turkes@eturkes.com
```

Characterisation of fractionated extracellular vesicles in Alzheimer's Disease.
Other than the raw data, this repo contains everything needed to reproduce results in the associated paper that were analysed using R.

Note that the project structure currently assumes a Unix environment as there are the top-level symbolic links `data` and `results` pointing to those respective directories within `storage`.
These may have to be recreated on non-Unix OS such as Windows.

To obtain the raw data and pre-computed results, please download this Google Drive folder:  
[https://drive.google.com/drive/folders/1WuZHpDzmFHFFVp1B6tU51ZQbQyBOY_jT?usp=sharing](https://drive.google.com/drive/folders/1WuZHpDzmFHFFVp1B6tU51ZQbQyBOY_jT?usp=sharing)  
The folder should then be renamed `storage` and placed in the top-level of this project.

If one wishes to simply see how the results were generated, they can visit the `results` directory at the top-level and open the pre-compiled R Markdown HTML files in a web browser.
These files will contain the documentation needed to view the results and understand how they were generated.
Otherwise, below we provide several options below for reproducing the results from scratch.
A user can alternatively simply use the default R version on their system and manually install needed packages, however, it is not supported and does not guarantee perfect reproduction of our results.

### 1. Docker

Docker is virtualisation software that allows the distribution of reproducible operating system environments, including userland software like R packages.
See here to install and set up Docker [https://www.docker.com/](https://www.docker.com/).
Once installed, the simplest option is to run `run_all.R` using the command below:

```
docker-compose up all
```

This will compile all R Markdown files non-interactively, replacing the existing files in the `results` dir and creating a `cache` dir containing intermediate data objects.
Note that until a solution is implemented, this method creates file as the root user.
To avoid this, consider using `run_all.R` or other files using RStudio Server, as instructed below.

RStudio Server is provided within the Docker image and can readily be accessed through a web browser either on one's local machine or through a remote server.
To get started, first create a `.env` file with the port that RStudio should connect to, as below:

```
PORT=8787
```

Any available port can be used and ports in the 8000 range are generally always open.
More details can be found at [https://github.com/rocker-org/rocker](https://github.com/rocker-org/rocker).

RStudio Server can then be started by running:

```
docker-compose up rstudio
```

You can then visit `http://localhost:8787/` in a web browser to use RStudio.

If one wants to run RStudio Server on a remote machine, it can be accessed through a local web browser by first running an SSH tunnel like below:

```
ssh -N -L 8787:localhost:8787 user@ip-address
```

The left-most port specifies the port desired locally, whereas the right-most is the port on the server.
The right-most argument is the user@ip-address details used to log into the server.
Once connected, visit `http://localhost:8787/` as before, assuming 8787 is the local port in the tunnel.
More details can be found here: [https://divingintogeneticsandgenomics.rbind.io/post/run-rstudio-server-with-singularity-on-hpc/](https://divingintogeneticsandgenomics.rbind.io/post/run-rstudio-server-with-singularity-on-hpc/).

### 2. Apptainer

Apptainer (previously named Singularity) is similar to Docker except with a different security structure that makes it easier to integrate with high-performance computing (HPC) clusters.
Installation instructions can be found at [https://apptainer.org/](https://apptainer.org/).
Similar to before, `run_all.R` is called with:

```
sh ./apptainer.sh all
```

To use RStudio, no `.env` file is needed, it is instead included in the command:

```
sh ./apptainer.sh rstudio 8787
```

In the same way as using Docker, RStudio Server will be accessible through a local web browser on localhost at the desired port.
An SSH tunnel can also be identically configured for accessing remote servers.
