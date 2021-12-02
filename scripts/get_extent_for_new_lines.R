library(sf)

# polygon from which  limits can be obtained for lat or long
poly_for_extent_wdd <- st_read(dsn = "C:/Users/Phillip Haupt/Documents/GIS/byelaw_areas/herring_byelaw.gpkg", layer = "Area_A") %>% st_transform(4326)# this could be ANY polygon if you wanted to make function

# get bounding box coordinates which provide the additional lat/long (x/y) points to add to teh line lat/long specified to create it.
extent_bbox <- st_bbox(poly_for_extent_wdd)



