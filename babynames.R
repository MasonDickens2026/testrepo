library(babynames)
library(ggplot2)
library(dplyr)

bb_names <- babynames
# Create a histogram for the name Marie since 1982. Notice anything weird?
ggplot(data = bb_names %>% filter(name == "Mary", year >= "1982"), 
       aes(x= year)) +
  geom_histogram() 

#Create a line plot for proportion of the name Joe, colored by sex. Make the lines a bit thicker and more transparent.

ggplot(data = bb_names %>% filter(name == "Joe"),
       aes(x= year, y= n, color = sex )) +
  geom_line()
  

