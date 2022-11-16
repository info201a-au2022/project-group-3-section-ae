library(dplyr)


final_dataset <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")

#Country that is the most safest to live in.

Safest_country <- function() {
  final_dataset <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")
  filter(final_dataset,Safety.Index == max(Safety.Index)) %>%
    select(Country) %>%
    return()
}
#Panama

#Country that has the most crime.
Not_most_safest_country <- function() {
  final_dataset <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")
  filter(final_dataset, Crime.Index == max(Crime.Index, na.rm = TRUE)) %>%
  select(Country) %>%
  return()
}
#Venezuela
 

#Country has the highest ratio of cost of living and groceries.

country_highest_ratio <- function() {
  final_dataset <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")
  mutate(final_dataset, ratio = Cost.of.Living.Index/Groceries.Index) %>%
  filter(ratio == max(ratio, na.rm = TRUE)) %>%
    select(Country) %>%
    return()
}
#Uruguay

#Country that has the lowest ratio of cost of living to groceries.

country_lowest_ratio <- function(){
  final_dataset <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")
  mutate(final_dataset, ratio = Cost.of.Living.Index/Groceries.Index) %>%
  filter(ratio == min(ratio, na.rm = TRUE)) %>%
    select(Country) %>%
    return()
}
#Puerto Rico

#Country that has the most affordable healthcare.

most_affordable_healthcare_country <- function() {
  final_dataset <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")
  filter(final_dataset, Health.Care.Index == max(Health.Care.Index, na.rm = TRUE)) %>%
    select(Country) %>%
    return()
}
#Mexico