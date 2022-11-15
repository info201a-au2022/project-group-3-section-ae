library(ggplot2)
library(dplyr)
data <- read.csv("/Users/daphnigeorge/Downloads/New_final_dataset - Sheet1.csv")
world_coordinates <- map_data("world")

world_coordinates <- rename(world_coordinates, Country = region)

data <- inner_join(x = data, y = world_coordinates, by = "Country")




countryPlot <- ggplot()+geom_polygon(data=data,aes(x=long, y=lat, group = group, fill=Health.Care.Index))+coord_map()


