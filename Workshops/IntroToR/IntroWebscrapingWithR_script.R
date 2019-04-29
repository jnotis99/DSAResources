## Dartmouth Sports Analytics 
## R Workshop 1: Introduction to Web Scraping and Data Wrangling with R
## Joseph Notis - Head of Research
## April 19, 2019


# 1. Installing packages --------------------------------------------------
# Remove the comment (marked by "#") if you need to install these packages 

# install.packages("tidyverse")
# install.packages("rvest")


# 2. Loading packages -----------------------------------------------------

library(tidyverse)
library(rvest)

# 3. Web scraping ---------------------------------------------------------

# Here we save the 2018 team-by-team relief pitching data as a variable called "url"
# This will make our web scraping code easier to understand
url <- "https://www.baseball-reference.com/leagues/MLB/2018-reliever-pitching.shtml"

# Generic web scraping code for any HTML table
# The data is extracted as a list
dta <- read_html(url) %>% 
  html_nodes("table") %>% 
  html_table()

# Save the desired data frame as a variable separate from the list
# This makes it easier to use when wrangling/visualizing the data
df <- dta[[1]]

# 4. Data Wrangling -------------------------------------------------------

# Create a vector (a list of objects) to hold any stats to analyze
stats <- c("Tm", "aLI", "LevHi", "LevMd", "LevLo")

# Using dplyr, manipulate the data
df <- df %>% 
  select(stats) %>%           # Select only the desired columns
  filter(Tm == "LgAvg") %>%   # Filter out rows to only keep the league average for all teams
  mutate(Year = 2018)         # Use mutate to add a variable (column) that stores the year for each row as 2018
