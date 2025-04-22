
library(dplyr)
library(tidyr)
library(ggplot2)
library(stringr)


netflix_data <- read.csv("netflix_titles.csv", stringsAsFactors = FALSE)


# SECTION D: Genre & Country Analysis

# 13. Top 10 genres using listed_in
top_genres <- netflix_data %>%
  separate_rows(listed_in, sep = ",\\s*") %>%
  count(listed_in, sort = TRUE) %>%
  top_n(10, n)
cat("13. Top 10 genres:\n")
print(top_genres)


# 14. Top 10 countries producing content
top_countries <- netflix_data %>%
  filter(!is.na(country) & country != "") %>%
  separate_rows(country, sep = ",\\s*") %>%
  count(country, sort = TRUE) %>%
  top_n(10, n)
cat("14. Top 10 countries:\n")
print(top_countries)

# 15. Top 5 genres for TV Shows vs. Movies
top_genres_by_type <- netflix_data %>%
  separate_rows(listed_in, sep = ",\\s*") %>%
  group_by(type) %>%
  count(listed_in, sort = TRUE) %>%
  top_n(5, n)
cat("15. Top 5 genres by type:\n")
print(top_genres_by_type)


