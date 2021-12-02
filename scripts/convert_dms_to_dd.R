library(tidyverse)
# convert ddm to dd function
source("C:/Users/Phillip Haupt/Documents/my_functions/ddm_to_dd_converter.R")
source("C:/Users/Phillip Haupt/Documents/my_functions/convert_dd_tibble_to_matrix.R")

#-------------------------------
# convert dms points to dd
# for lines which only a single coorindate value is supplied.
# dms_to_dd_fn(lines_pts_dms) %>% rename(X = dd)# pts after conversion for lnes at dms lines 1.1. and 1.2 - if you want  atibble
lines_pts_dd <- map_df(lines_pts_dms, dms_to_dd_fn)#map(~ .x, rename(X = dd)) # list of atomic vectors are easier here becuase you can apply a function repeatedly.
# for points
eagle_bank_pts_dd <- dms_to_dd_fn(eagle_bank_pts_dms)$dd %>% dd_tibble_to_matrix() # eagle bank points dms to dd
studhill_centroid_pt_dd <- dms_to_dd_fn(studhill_centroid_pt_dms)$dd %>% dd_tibble_to_matrix() # studhill dms to dd
#--------------------------------------------------------
