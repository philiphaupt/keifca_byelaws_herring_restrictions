library(tidyverse)
library(sf)

# ggplot()+
#         geom_sf(data = poly_for_extent_wdd)+
#         geom_sf(data = eagle_bank_byelaw_wgs_sf, fill = "red", alpha = 0.5)+
#         #geom_point(data = eagle_bank_pts_dd %>% as_tibble(), aes(x = X, y = Y))
#         geom_sf(data = studhill_byelaw_poly_wgs_sf, fill = "red", alpha = 0.5)+
#         geom_sf(data = byelaw_lines_wdd, col = c("red", "blue"), lty = "dashed")+
#         coord_sf(ylim = c(51.32, 51.85))+
#         theme_bw()

ggplot()+
        geom_sf(data = poly_for_extent_wdd)+
        geom_sf(data = eagle_bank_byelaw_wgs_sf, fill = "red", alpha = 0.5)+
        #geom_point(data = eagle_bank_pts_dd %>% as_tibble(), aes(x = X, y = Y))
        geom_sf(data = studhill_byelaw_poly_wgs_sf, fill = "red", alpha = 0.5)+
        geom_sf(data = byelaw_lines_Thames_wdd, col = c("red", "blue"), lty = "dashed")+
        coord_sf(ylim = st_bbox(byelaw_lines_Thames_wdd)[c(2,4)])+
        theme_bw()
