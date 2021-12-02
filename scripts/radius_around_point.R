# aim create a radius around a point at knwon distance: Studhill defintion (!NM around pt)

library(tidyverse)
library(sf)
library(units)

#steps
# 1) point to sf object, crs 4326 (WGS84)
# 2) transform the point to crs 32631 (UTM 31)
# 3) convert distance from NM to m
# 4) apply buffer of radius to point to create a new polygon 

#1.
studhill_sf <- studhill_centroid_pt_dd %>% 
        st_point() %>% 
        st_sfc() %>% 
        st_sf(crs = 4326)

#2.
studhill_utm31_sf <- st_transform(studhill_sf, crs = 32631)

#3.
#units_df <- units::valid_udunits() gets list of names for units
radius_dist <- 1
radius_dist_nm <-units::set_units(radius_dist, 	nautical_mile)
radius_dist_m <- radius_dist_nm
units(radius_dist_m) <- with(units::ud_units, m)

#4. buffer around point at radius of 1 NM, or 1852 m (as sorted above)
studhill_poly_utm_sf <- st_buffer(studhill_utm31_sf, radius_dist_m)

# 5 transform projection to WGS84
studhill_byelaw_poly_wgs_sf <- studhill_poly_utm_sf %>% st_transform(4326)

studhill_byelaw_poly_wgs_sf <- studhill_byelaw_poly_wgs_sf %>% 
        mutate(name = "Studhill")

st_write(studhill_byelaw_poly_wgs_sf, dsn = gi_file_name, layer = "Studhill", delete_layer = TRUE)
# NOt RUN{
# 5 test plot
# ggplot()+
#        geom_sf(data = studhill_byelaw_poly_wgs_sf)
#}