#    This file is part of AD-EV-characterisation.
#    Copyright (C) 2022-2023  Emir Turkes, Stephanie Fowler, UK DRI at
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

# This script runs all files in the analysis.
# Sections can be commented out as needed.

setwd(dirname(parent.frame(2)$ofile)) # Move to location of this file.

rmarkdown::render(
  file.path("Fig1.BC_FigS2_FigS3.C_FigS4.D_TableS1_TableS2.Rmd"),
  output_file = file.path("..", "results", "Fig1.BC_FigS2_FigS3.C_FigS4.D_TableS1_TableS2.html")
)
rmarkdown::render(
  file.path("FigS3.AB_FigS4.ABC.Rmd"),
  output_file = file.path("..", "results", "FigS3.AB_FigS4.ABC.html")
)
rmarkdown::render(
  file.path("FigS5.CDEF.Rmd"),
  output_file = file.path("..", "results", "FigS5.CDEF.html")
)
rmarkdown::render(
  file.path("FigR2_FigR3_FigR4.AB.Rmd"),
  output_file = file.path("..", "results", "FigR2_FigR3_FigR4.AB.html")
)
