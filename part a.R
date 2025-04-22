library(dplyr)
library(janitor)
library(tidyverse)


#section A

# Load the dataset
netflix_data <- read.csv("netflix_titles.csv")



# 1. Count total records
total_records <- nrow(netflix_data)
print(total_records)




# 2. Percentage of Movies vs. TV Shows
content_distribution <- netflix_data %>%
  count(type) %>%
  mutate(percentage = n / sum(n) * 100)
print(content_distribution)




# 3. Top 5 most common content ratings
top_content_ratings <- netflix_data %>%
  count(rating, sort = TRUE) %>%
  top_n(5)
print(top_content_ratings)




# 4. Count rows with missing data and identify columns with most missing values
missing_counts <- netflix_data %>%
  summarise(across(everything(), ~sum(is.na(.)))) %>%
  pivot_longer(cols = everything(), names_to = "column", values_to = "missing_count") %>%
  arrange(desc(missing_count))
print(missing_counts)




# 5. Number of unique countries represented
unique_countries <- netflix_data %>%
  filter(!is.na(country)) %>%
  summarise(unique_count = n_distinct(country))
print(unique_countries)