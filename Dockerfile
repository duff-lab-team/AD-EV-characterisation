#    This file is part of AD-EV-characterisation.
#    Copyright (C) 2022  Emir Turkes, Stephanie Fowler, UK DRI at UCL, Columbia
#    University Medical Center
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#    Emir Turkes can be contacted at emir.turkes@eturkes.com

FROM rocker/rstudio:4.2.1

LABEL org.opencontainers.image.authors="Emir Turkes emir.turkes@eturkes.com"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        pkg-config \
        zlib1g-dev \
        libpng-dev \
        libnetcdf-dev \
        libxml2-dev \
        libproj-dev \
        libcairo2-dev \
        libxt-dev \
        libgsl23 \
        libgdal26 \
    && Rscript -e "install.packages('conflicted')" \
        -e "install.packages('rmarkdown')" \
        -e "install.packages('rprojroot')" \
        -e "install.packages('DT')" \
        -e "install.packages('data.table')" \
        -e "install.packages('readxl')" \
        -e "install.packages('pheatmap')" \
        -e "install.packages('plyr')" \
        -e "install.packages('UpSetR')" \
        -e "install.packages('dplyr')" \
        -e "install.packages('hexbin')" \
        -e "install.packages('openxlsx')" \
        -e "install.packages('ggbeeswarm')" \
        -e "install.packages('khroma')" \
        -e "install.packages('svglite')" \
        -e "install.packages('fastmatch')" \
        -e "install.packages('volcano3D')" \
        -e "install.packages('VennDiagram')" \
        -e "install.packages('mice')" \
        -e "install.packages('BiocManager')" \
        -e "install.packages('remotes')" \
        -e "BiocManager::install('DEP')" \
        -e "BiocManager::install('GSVA')" \
        -e "BiocManager::install('variancePartition')" \
        -e "BiocManager::install('biomaRt')" \
        -e "BiocManager::install('EnhancedVolcano')" \
        -e "BiocManager::install('preprocessCore', configure.args = '--disable-threading', force = TRUE)" \
        -e "BiocManager::install('NormalyzerDE')" \
        -e "remotes::install_github('lgatto/pRolocdata')" \
    && apt-get clean \
    && rm -Rf /var/lib/apt/lists/ \
        /tmp/downloaded_packages/ \
        /tmp/*.rds
