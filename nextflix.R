library(dplyr)
library(tidyr)
library(ggplot2)
library(stringr)

# Read the dataset
netflix_data <- read.csv("netflix_titles.csv", stringsAsFactors = FALSE)



na_counts <- sapply(netflix_data, function(x) sum(is.na(x) | x == "")) 
cat("6. NA counts per column:\n")
print(na_counts)


netflix_data <- netflix_data %>%
  mutate(title_length = nchar(title))

longest_title <- netflix_data %>%
  slice(which.max(title_length))
cat("8. Longest title:", longest_title$title, "\n")
cat("   Character count:", longest_title$title_length, "\n")

avg_title_length <- netflix_data %>%
  group_by(type) %>%
  summarise(avg_length = mean(title_length, na.rm = TRUE))
cat("9. Average title length by type:\n")
print(avg_title_length)


