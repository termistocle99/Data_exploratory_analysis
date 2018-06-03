# i have already dowloaded the zip file and unzip it in a directory

setwd("C:/Users/Ali TIMITE/Downloads/data science/4-exploratory data analysis/semaine4/exam-assignement/exdata_data_NEI_data")
library(tidyverse)

classification <- readRDS("Source_Classification_Code.rds") 
resume <- readRDS("summarySCC_PM25.rds")

baltimore_emissions <- filter(resume, resume$fips=="24510") # filter resume to find baltimore only values
baltiyeartype_emissions <- aggregate(Emissions ~ year+type, baltimore_emissions, sum)

chart <- ggplot(baltiyeartype_emissions, aes(year, Emissions, color = type))
chart <- chart + geom_line() + xlab("year") + ylab(expression('Total Emissions')) + ggtitle('Total Baltimore Emissions [2.5]* From 1999 to 2008') # charting
 print(chart)