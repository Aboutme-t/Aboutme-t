## Hand_on_data_transformation in R

## transform nycflights13

library(nycflights13)
library(tidyverse) # dplyr


## ask questions about this dataset

## select filter arrange mutate summarise count
## Q1. most flight carrier in Sep 2013
flights %>%
  filter(month == 9, year == 2013) %>%
  count(carrier) %>%
  arrange(desc(n)) %>%
  head(5) %>%
  left_join(airlines)


##Q2. How many flights occurred in 2013

flights %>%
  filter(year == 2013) %>%
  select(year) %>% 
  group_by(year) %>%
  summarize(total_flights = n())

##Q3. How many flights occurred each month in 2013

flights %>%
  filter(year == 2013) %>%
  select(year,month) %>% 
  group_by(month) %>%
  summarize(total_flights = n())

##Q4. Which month occurred most flights in 2013

flights %>%
  filter(year == 2013) %>%
  group_by(month) %>%
  summarize(total_flights = n())%>% 
  arrange(desc(total_flights)) %>%
  head(1) 



##Q5. Which airline carrier had the fewest flights in the year 2013 

flights %>%
  filter(year == 2013) %>%
  count(carrier, name = "n_flight") %>%
  arrange(n_flight) %>%
  head(1) %>%
  left_join(airlines)

##Q6. What is the average departure delay for flights

flights %>% 
  summarise(avg_delay = mean(dep_delay, na.rm = T))

##Q7. How many time the delay occurred

flights %>%
  filter(dep_delay > 0) %>%
  count()


##Q.8 Which airline carrier had the maximum departure delay

flights %>%
  select(carrier,dep_delay) %>%
  arrange(desc(dep_delay)) %>%
  head(1) %>%
  left_join(airlines)

##Q.9 What are the top 5 destinations (airports) based on the total number of flights departing to each destination?

flights %>% 
  group_by(dest) %>% 
  summarize(total_flights = n()) %>% 
  arrange(desc(total_flights)) %>% 
  left_join(airports, by = c("dest" = "faa")) %>% 
  select(dest_code = dest, 
         airport_name = name,
         total_flights) %>%
  head(5)

##Q.10 Which day of the week has the fewest total flights?

flights %>% 
  mutate(day = weekdays(time_hour)) %>% 
  group_by(day) %>% 
  summarise(total_flights = n()) %>% 
  arrange((total_flights)) %>% 
  head(1)









