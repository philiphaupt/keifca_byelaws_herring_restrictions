library(tidyverse)

lines_pts_dd_df <- lines_pts_dd %>% mutate(line_names = c("a", "b")) #%>% split(f = lines_pts_dd$line_names)

# create line coordinate points - this is soimething that should be generalised into a function
lines_coordinate_pts_df <- tribble(
        ~line_names, ~X, ~Y,
        lines_pts_dd_df$line_names[1], lines_pts_dd_df$dd[1], extent_bbox[2],
        lines_pts_dd_df$line_names[1], lines_pts_dd_df$dd[1], extent_bbox[4],
        lines_pts_dd_df$line_names[2], lines_pts_dd_df$dd[2], extent_bbox[2],
        lines_pts_dd_df$line_names[2], lines_pts_dd_df$dd[2], extent_bbox[4],
) # but if there are many lines you need a function


# finish in due course and replace above


# long_lines_coordinate_pts_df_fn <- function(.line_x_coordinates_dd, .corresponding_coordinates = extent_bbox){
#         lines_coordinate_pts_tibble <- tribble(
#          ~X, ~Y,
#         .line_x_coordinates_dd, .corresponding_coordinates[1],
#         .line_x_coordinates_dd, .corresponding_coordinates[3]
# )
# } # 2 and 4 would be latitude lines - can make latitute function if required.
# 
# test <- lines_coordinate_pts_df_fn(.line_x_coordinates_dd = pluck(pluck(lines_pts_dd,1),1))
# 
# test <- map(lines_pts_dd, long_lines_coordinate_pts_df_fn)
# 
# test <-lines_pts_dd %>% map( ~ .x %>% map(~ lines_coordinate_pts_df_fn(.)))
# test <-lines_pts_dd %>% map( ~ dplyr::select(.x, X) %>% 
#         map( ~ lines_coordinate_pts_df_fn(.))
# )
# #names(lines_pts_dd[1])
