library(dplyr)


final_dataset <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ae/main/data/New_final_dataset%20-%20Sheet1.csv")

#Country that is the most safest to live in.

Safest_country <- final_dataset %>%
  filter(Safety.Index == max(Safety.Index)) %>%
  pull(Country)
print(Safest_country)
#Panama

#Country that has the most crime.
Not_most_safest_country <- function(final_dataset) {
  filter(final_dataset, Crime.Index == max(Crime.Index, na.rm = TRUE)) %>%
  return(Country)
}
#Venezuela
 

#Country has the highest ratio of cost of living and groceries.

country_highest_ratio <- final_dataset %>%
  mutate(ratio = Cost.of.Living.Index/Groceries.Index) %>%
  filter(ratio == max(ratio, na.rm = TRUE)) %>%
  pull(Country)
#Uruguay

#Country that has the lowest ratio of cost of living to groceries.

country_lowest_ratio <- final_dataset %>%
  mutate(ratio = Cost.of.Living.Index/Groceries.Index) %>%
  filter(ratio == min(ratio, na.rm = TRUE)) %>%
  pull(Country)
#Puerto Rico

#Country that has the most affordable healthcare.

most_affordable_healthcare_country <- final_dataset %>%
  filter(Health.Care.Index == max(Health.Care.Index, na.rm = TRUE)) %>%
  pull(Country)
#Mexico