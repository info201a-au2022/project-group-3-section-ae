library("knitr") # make sure you load the package (once per document)

data <- read.csv("/Users/daphnigeorge/Downloads/New_final_dataset - Sheet1.csv")
data_p<- function(data) {
  mutate_if(data, is.numeric, round)
data <- data %>% group_by(Health.Care.Index) 
df <- data.frame( Health.Care.Index = data['Health.Care.Index'],Country = data["Country"], cost_of_living = data["Safety.Index"])

#kable(df)
}
practice <- data_p(data)
kable(practice)