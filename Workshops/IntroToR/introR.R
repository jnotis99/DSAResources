## R Tutorial: Loading data and intro to data wrangling
## Dartmouth Sports Analytics, Spring 2020


# install/load packages ---------------------------------------------------

# Remove the comment from the next line if you never used tidyverse
# install.packages("tidyverse") 

# Load tidyverse package
library(tidyverse)


# Loading data ------------------------------------------------------------

# Read in a csv file and store it to a variable
# Edit filepath based on where you placed the .csv and .rproj file
filename <- "DSAResources/Workshops/IntroToR/rankings_538.csv"
dta <- read.csv(filename)

# Interacting with data in base R -----------------------------------------

# View the top of the data frame
head(dta)

# View the bottom of the data frame
tail(dta)

# View a column (variable)
dta[, "team"] # Can also be numeric, but best to use column names
dta["team"] 
dta$team 

# View a row (observation)
dta[1, ]

# Find an observation without knowing row numbers - logical operators
dta[dta$team == "LAL", ] # If you would like, add column names in quotes to filter out specific columns
dta[dta$raptor_projW >= 41, ]

# Data wrangling with tidyverse (part 1) ----------------------------------

# The pipe operator ( %>% ) tells R to "go to the next command and do what it says on the same data" 
# shift + control/command + "m" is a shortcut to easily add a pipe operator to your code

# Select specific columns
dta %>% 
  select(team, raptor_current, raptor_fs)

# Select and rename
dta %>% 
  select(team,
         W = current_W,
         L = current_L)

# sort based on a specific variable
dta %>% 
  arrange(raptor_fs) # Default is ascending order

dta %>% 
  arrange(desc(raptor_fs)) # desc(column_name) will change the arrangement to descending order

# add new columns to the data frame
dta %>% 
  mutate(gp = current_W + current_L)

dta %>% 
  mutate(gp = current_W + current_L,
         win_pct = current_W / gp) # You can use previously mutated columns as long as they appear before you use them  

# summarize columns in the data frame
dta %>% 
  summarize(avg_W = mean(current_W))

dta_summarized <- dta %>% 
  summarize(avg_w = mean(current_W),
            avg_projW = mean(raptor_projW))

mean_w <- dta_summarized[1, "mean_w"]
mean_projW <- dta_summarized[1, "mean_rtg"]





