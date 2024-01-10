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

# This script runs all files in the analysis.
# Sections can be commented out as needed.

setwd(dirname(parent.frame(2)$ofile)) # Move to location of this file.

xfun::Rscript_call(
  rmarkdown::render,
  list(
    file.path("Fig1.BC_FigGit2_FigGit3.C_FigGit4.D_ExtDEP_ExtGSE.Rmd"),
    output_file = file.path("..", "results", "Fig1.BC_FigGit2_FigGit3.C_FigGit4.D_ExtDEP_ExtGSE.html"),
    envir = new.env()
  )
)
xfun::Rscript_call(
  rmarkdown::render,
  list(
    file.path("FigGit3.AB_FigGit4.ABC.Rmd"),
    output_file = file.path("..", "results", "FigGit3.AB_FigGit4.ABC.html"),
    envir = new.env()
  )
)
xfun::Rscript_call(
  rmarkdown::render,
  list(
    file.path("FigExt2.EFGH_FigExt4.B.Rmd"),
    output_file = file.path("..", "results", "FigExt2.EFGH_FigExt4.B.html"),
    envir = new.env()
  )
)
xfun::Rscript_call(
  rmarkdown::render,
  list(
    file.path("FigExt1_FigExt3.Rmd"),
    output_file = file.path("..", "results", "FigExt1_FigExt3.html"),
    envir = new.env()
  )
)
