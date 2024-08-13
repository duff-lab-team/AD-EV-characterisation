#    This file is part of AD-EV-characterisation.
#    Copyright (C) 2022-2024  Emir Turkes, Stephanie Fowler, UK DRI at
#    UCL, Columbia University Medical Center
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
        libxml2 \
        zlib1g-dev \
        libnetcdf15 \
        libglpk-dev \
        libgeos-dev \
    && Rscript -e "install.packages('rmarkdown')" \
        -e "install.packages('markdown')" \
        -e "install.packages('conflicted')" \
        -e "install.packages('khroma')" \
        -e "install.packages('svglite')" \
        -e "install.packages('fastmatch')" \
        -e "install.packages('reshape2')" \
        -e "install.packages('ggbeeswarm')" \
        -e "install.packages('VennDiagram')" \
        -e "install.packages('mice')" \
        -e "install.packages('Seurat')" \
        -e "install.packages('BiocManager')" \
        -e "BiocManager::install('ComplexHeatmap')" \
        -e "BiocManager::install('DEP')" \
        -e "BiocManager::install('GSEABase')" \
        -e "BiocManager::install('GSVA')" \
        -e "BiocManager::install('biomaRt')" \
	-e "BiocManager::install('glmGamPoi')" \
    && apt-get clean \
    && rm -Rf /var/lib/apt/lists/ \
        /tmp/downloaded_packages/ \
        /tmp/*.rds
