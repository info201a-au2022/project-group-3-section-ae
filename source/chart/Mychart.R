library(ggplot2)
library(dplyr)

create <- function(data) {
  world_coordinates <- map_data("world")
  world_coordinates <- rename(world_coordinates, Country = region)
  data <- inner_join(x = data, y = world_coordinates, by = "Country")
  countryPlot <- ggplot()+geom_polygon(data=data,aes(x=long, y=lat, group = group, fill=Health.Care.Index))+coord_map()
  countryPlot<- countryPlot + labs(title = "Healthcare Index in North & South America") +
    theme(plot.title = element_text(face="bold", size=15)) 

  
}

da <- create(read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv"))
