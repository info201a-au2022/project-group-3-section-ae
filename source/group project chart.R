library(dplyr)

library(ggplot2)

#cost_of_living <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")
#View(cost_of_living)


cost_of_living <- function(data) {
df_cost_of_living <- select (data, 1,6,9)
#View(df_cost_of_living)


scatterplot <- ggplot(data=df_cost_of_living, aes(x=Groceries.Index, y=Cost.of.Living.Index))+
  geom_point()

scatterplot + labs(title = "                                Cost of Food in North and South America")
}

#View(scatterplot)































