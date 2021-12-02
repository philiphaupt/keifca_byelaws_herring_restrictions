# main_script

# Project AIM: Convert coordinates from byelaws into polygons, lines, points that can be mapped.

# Methods
#----------------# Instructions to make a line that extends beyond the district
# 1. if pts in dms , convert to dd first, and store as object/s, then
# 2. making a line that cuts through the district
# 3. read in district, get boundaing box
# 4. max and min values of bbox + and - arbitrary value
# 5. create a vector of points, using the line value, then max+arb value, then line value again, then min-arb value
# - done
# ...decide if you need to crop the district - to create polygons
# 6. check the polygons, and the buffer around a point.
#------------------
rm(list = ls())
# Write to file USER INPUT: file_name
gi_file_name <- "herring_byelaw_boundaries.gpkg"
# common libraries
library(tidyverse)
library(sf)
#---------------------
options(digits = 12) # display decimal points to 5 positions
# 1) Define boundaries
source("./scripts/extract_dms_coordinates_from_byelaw.R") # needs cleaning up

# 2) Convert DMS points to dd and store as XY wdd matrices
source("./scripts/convert_dms_to_dd.R")

# FOR LINES
# 3) Read in district to get BBOX limits
source("./scripts/get_extent_for_new_lines.R") # from BBOX of polygon, like district

# 4) create matrix of coordinates for lines
source("./scripts/make_lines_pt_matrix.R") # output at present lines_coordinate_pts_df

# 5) make lines spatial: convert points to lines and promote to sf object
source("./scripts/pts_to_lines.R")

# 6) crop lines to the district boundaries
source("./scripts/crop_lines_extent_poly.R")
# write polys to file?
#-------------------------

#7) Byelaws specified as coordinates of a polygon/s
source("./scripts/pts_to_polys.R")# for Eagle Bank

#--------------------------
# 8) Byelaws specified as radius from centroid with knwon distance
source("./scripts/radius_around_point.R") # for Studhill

# 9 Test plot Herring byelaws
source("./scripts/test_plot_herring_byelaws.R")


