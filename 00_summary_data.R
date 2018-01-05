# load data and source
library(tidyverse)
library(lubridate)
source("../R/load.R")
source("../R/clean.R")
# loadload the liver dataset
liver_data_list <- loadUNOSFile("Delimited Text File/Liver/LIVER_DATA")
# extract only the training data
liver_data <- liver_data_list$training_data

# how many patients are placed onto the waitinglist each month?
liver_data %>% 
  filter(INIT_DATE >= ymd("2016-09-01"),
         INIT_DATE <= ymd("2016-09-30")) %>%
  # how many were transplanted within a month
  #filter(as.numeric(TX_DATE - INIT_DATE) < 30) %>%
  # how many were transplanted within 3 months
  summarise(transplanted = sum(TX_DATE < ymd("2017-01-01"), na.rm = T),
            died_waiting = sum(DEATH_DATE < ymd("2017-01-01"), na.rm = T),
            left_list = sum(END_DATE < ymd("2017-01-01") & is.na(TX_DATE) & is.na(DEATH_DATE)),
            still_waiting = sum(END_DATE > ymd("2016-12-31")))
  
  
