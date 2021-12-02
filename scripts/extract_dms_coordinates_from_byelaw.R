# aim: make a tibble listing the coordinates as from the byelaw.
#---------------------

library(tidyverse)
library(sf)

# 1) beylaw
cat("1) No person shall use when fishing for herring within that part of the Local Fisheries District which is situated in the Thames Estuary West of a line 01d20'E, a drift net with a mesh of less than 54 millimetres or a trawl net with a mesh of less than 50 millimetres as measured in accordance with Commission Regulation (EEC) 2108/84.\n
2) No person shall remove herring from within that part of the Committee (IFCA District which is situated within the Thames Estuary west of a line longitude 1d10'E after the date determined annually as the closure date of the Thames Estuary Herring Fishery (when the total allowable catch for that fishery has been taken up).\n
3) No person shall operate a trawl, dredge or anchored net over or on the Eagle Bank off the coast of the County of Essex and/or Studhill (known also as the Herring Bank) off the coast of the County of Kent during the period 1st February to 1st June in any year.\n
4) No person or persons shall use when fishing for herring from a vessel any drift net or group of drift nets exceeding 250 metres in length in the areas defined as the Eagle Bank and Studhill (also known as the Herring Bank) between 1 March and 30 June.\n
5) For the purpose of this byelaw, the Eagle Bank is defined as the area enclosed by a straight line drawn from a point 51d44.683'N, 01d04.417'E to a point 51d43.85'N,     01d05.17'E, thence to a point 51d44.1'N, 01d03.917'E, thence to a point 51d44.58'N, 01d02.67'E, and finally to a point 51d44.683'N, 01d04.417'E. Studhill (known also as the Herring Bank) is defined as the area enclosed within a radius of one nautical mile from the end of the landing stage at Herne Bay pier, situa
    ted at latitude 51d23'N and longitude 1d07'E.")


# USER INPUT: Enter the coordinates as per byelaw
# Coordinate of boundary line as defined in  byelaw
line_1 <- "01d10"
line_2 <- "01d20"
lines_pts_dms <- list(a = line_1, b = line_2) # make a list o fthe lines, and assign a name
#lines_pts_dms <- c(line_1, line_2) # make a list o fthe lines, and assign a name

# Eagle bank (polygon, of which points as defined in byelaw as follows)
eagle_bank_pts_dms <- c(
    "1d04.417",
    "51d44.683",
    "01d05.17",
    "51d43.85",
    "01d03.917",
    "51d44.10",
    "01d02.67",
    "51d44.58",
    "01d04.417",
    "51d44.683"
    
)

# studdhill
studhill_centroid_pt_dms <- c("1d07", "51d23")
