library(babynames)
library(ggplot2)
library(dplyr)
library(tidyverse)

bb_names <- babynames
# Create a histogram for the name Marie since 1982. Notice anything weird?
ggplot(data = bb_names %>% filter(name == "Mary", year >= "1982"), 
       aes(x= year)) +
  geom_histogram() 

#Create a line plot for proportion of the name Joe, colored by sex. Make the lines a bit thicker and more transparent.
ggplot(data = bb_names %>% filter(name == "Joe"),
       aes(x= year, y= n, color = sex )) +
  geom_line() +

  # Add new x and y axis labels, as well as a chart title.
  labs(x = "Male names", y = "Female names", color = "sex", title = "Line plot", caption = "DataLab 2024")

# Create a bar chart of the 10 most popular female names in 2002.
ggplot(data = bb_names %>% 
         filter(sex  == "F", year == "2002") %>%
         arrange(desc(n)) %>% slice_head(n = 10),
      aes(x= name, y= n)) +
   geom_col(alpha = 0.5, fill = "blue")

# Create a new data set called the_nineties that only contains years from the 1990s.  

the_nineties <- bb_names %>%
 filter(year == "1990")

# Save this dataset to your repository (use write_csv()).
  
write_csv(the_nineties, "the_nineties.csv")

#Now that everything is up to date, make a visualisation of you and your team member’s names for a year of your choice.

group_names <- bb_names %>%
  filter(year == "2004")

ggplot(data = group_names %>%
filter(name %in% c("Cheyenne", "Mason", "Lucy", "Ruth")),
      aes(x= name, y= n,)) +
geom_col() +
facet_wrap( ~sex)

