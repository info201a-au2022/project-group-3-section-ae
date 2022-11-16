
#Country that is the most safest to live in.

Safest_country <- df_crime %>%
  filter(Safety.Index == max(Safety.Index, na.rm = TRUE)) %>%
  pull(Country)
#Panama

#Country that has the most crime.
Not_most_safest_country <- df_crime %>%
  filter(Crime.Index == max(Crime.Index, na.rm = TRUE)) %>%
  pull(Country)
#Venezuela
 

#Country has the highest ratio of cost of living and groceries.

country_highest_ratio <- df_cost_of_living %>%
  mutate(ratio = Cost.of.Living.Index/Groceries.Index) %>%
  filter(ratio == max(ratio, na.rm = TRUE)) %>%
  pull(Country)
#Uruguay

#Country that has the lowest ratio of cost of living to groceries.

country_lowest_ratio <- df_cost_of_living %>%
  mutate(ratio = Cost.of.Living.Index/Groceries.Index) %>%
  filter(ratio == min(ratio, na.rm = TRUE)) %>%
  pull(Country)
#Puerto Rico

#Country that has the most affordable healthcare.

most_affordable_healthcare_country <- final_dataset %>%
  filter(Health.Care.Index == max(Health.Care.Index, na.rm = TRUE)) %>%
  pull(Country)
#Mexico