
final_dataset <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")
View(final_dataset)

library(dplyr)
library(ggplot2)

df_crime <- select(final_dataset, 1,4,5)
View(df_crime)


#bar graph

my_bar_graph <- ggplot(df_crime, aes(x = Crime.Index, y = Country, fill = Safety.Index)) +
  geom_col() 
my_bar_graph + labs(title = "Crime and Safety in North & South America") +
  theme(plot.title = element_text(face="bold", size=15)) 



