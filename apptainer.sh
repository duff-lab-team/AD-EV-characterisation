#!/bin/sh

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

# Shell script for building an Apptainer image from Docker Hub and running it
# See README of this project for further details

apptainer pull ad-ev-characterisation.sif docker://dufflab/ad-ev-characterisation:R4.2.1v5

if [ "$1" = "all" ]; then
    apptainer exec \
        -B .:/home/rstudio/AD-EV-characterisation \
        ad-ev-characterisation.sif \
    Rscript -e "source('/home/rstudio/AD-EV-characterisation/R/run_all.R')"

elif [ "$1" = "rstudio" ]; then
    DISABLE_AUTH=true RSTUDIO_SESSION_TIMEOUT="0" \
    apptainer exec \
        -B .:/home/rstudio/AD-EV-characterisation \
        ad-ev-characterisation.sif \
    rserver --www-address=127.0.0.1 --www-port=$2 --server-user=$USER
fi
