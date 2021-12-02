# aim: take tibble or matrix of points and convert to sf line object/geometry
library(tidyverse)
library(sf)

line_geoms <- lines_coordinate_pts_df %>% 
        split(f = lines_coordinate_pts_df$line_names) %>% 
        map(~.x %>%  dplyr::select(X,Y)) %>% 
        map(~.x %>% as.matrix) %>% 
        map(~.x %>% st_linestring(., dim = "XY")) %>% 
        map_df(~.x %>% st_sfc(.) %>% st_sf(.)) # changes output to data frame
        
byelaw_lines_wdd <- line_geoms %>% st_set_crs(4326) #not working yet to set crs??
   

byelaw_lines_wdd <- byelaw_lines_wdd %>% mutate(name = c("West of 1d1.00", "West of 1d2.00"))     
#test plot
# ggplot(data = byelaw_lines_wdd)+
#         geom_sf()



# if yo uprefer each as a layer, change ma_df to map above, and use this to write to file
# write to file - can I dynamically change layer name to reflect line id?
# line_geoms %>% walk(
#         ~.x %>% st_write(dsn = "herring_byelaw_lines.gpkg", layer = "byelaw_lines", append = TRUE)
# )



