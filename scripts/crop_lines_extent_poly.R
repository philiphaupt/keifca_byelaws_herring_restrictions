# aim crop the lines by the points along the boundary of the district
library(sf)
library(tidyverse)
st_bbox(byelaw_lines_wdd)
byelaw_lines_Thames_wdd <- st_crop(byelaw_lines_wdd, xmin = 1.15, xmax = 1.4, ymin = 51.37255, ymax = 51.929833)#extent_bbox ymax 1d1 = 51.80201)

# test plot
# NOT RUN{
#ggplot()+
#        geom_sf(data = byelaw_lines_Thames_wdd, col = c("red", "blue"), lty = "dashed")
#}

st_write(byelaw_lines_Thames_wdd, dsn = gi_file_name, layer = "byelaw_lines_Thames_wdd", delete_layer = TRUE)

