library(ggplot2)
library(dplyr) 
library(tidytext)
library(gsheet)
library(wordcloud2)
library(sentimentr)
library(lubridate) 
survey <- gsheet::gsheet2tbl('https://docs.google.com/spreadsheets/d/1W9eGIihIHppys3LZe5FNbUuaIi_tfdscIq521lidRBU/edit?usp=sharing')

# Take a look at the first few rows of the data. What is the unit of observation?
# People and there answers

# 5. Create a variable named date_time in your survey data. This should be based on the Timestamp variable. Use the mdy_hms variable to created a “date-time” object.
survey2 <- survey %>% 
mutate(date_time = mdy_hms(Timestamp))


# 6. Create a visualization of the date_time variable.
ggplot(data = survey2, aes(x = date_time)) +
  geom_histogram()
  
# 7. Create an object called sentiments by running the following:

sentiments <- get_sentiments('bing') 

# Explore the sentiments object. How many rows? How many columns? What is the unit of observation.
#There are 2 rows and 6,786 entries.

# 9. Create an object named words by running the following:
words <- survey %>%
  dplyr::select(first_name,
                feeling_num,
                feeling) %>%
  unnest_tokens(word, feeling)

# Explore words. What is the unit of observation.
# Feeling_num

# 11. Look up the help documentation for the function wordcloud2. What does it expect as the first argument of the function?



