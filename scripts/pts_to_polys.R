# aim convert a series of points to a polygon (single)
library(sf)

eagle_bank_byelaw_wgs_sf <- list(eagle_bank = eagle_bank_pts_dd) %>% 
        st_polygon() %>% 
        st_sfc() %>% 
        st_sf(crs =4326)

eagle_bank_byelaw_wgs_sf <- eagle_bank_byelaw_wgs_sf %>% 
        mutate(name = "Eagle Bank")

st_write(eagle_bank_byelaw_wgs_sf, dsn = gi_file_name, layer = "Eagle Bank", delete_layer = TRUE)

# nodes
eagle_bank_byelaw_nodes_wgs_sf <- eagle_bank_pts_dd %>% 
        st_multipoint() %>% 
        st_sfc %>% 
        st_sf(crs = 4326) %>% 
        st_cast("POINT")

eagle_bank_byelaw_nodes_wgs_sf <- eagle_bank_byelaw_nodes_wgs_sf %>% 
        mutate(X = st_coordinates(eagle_bank_byelaw_nodes_wgs_sf)[,1],
               Y = st_coordinates(eagle_bank_byelaw_nodes_wgs_sf)[,2])

eagle_bank_byelaw_nodes_wgs_sf$X %>% dd_to_ddm_fn()

st_write(eagle_bank_byelaw_nodes_wgs_sf,
         dsn = gi_file_name,
         layer = "Eagle Bank coordinate points")
# test plot
# NOt RUN {
# ggplot(data = eagle_bank_sf)+
#         geom_sf()+
#         geom_point(data = eagle_bank_pts_dd %>% as_tibble(), aes(x = X, y = Y))
#}