# i have already dowloaded the zip file and unzip it in a directory

setwd("C:/Users/Ali TIMITE/Downloads/data science/4-exploratory data analysis/semaine4/exam-assignement/exdata_data_NEI_data")
library(tidyverse)

classification <- readRDS("Source_Classification_Code.rds") 
resume <- readRDS("summarySCC_PM25.rds")

emissions_annuelles <- aggregate(Emissions ~ year, resume, sum)

cols <- c("blue", "aquamarine", "green", "yellow")
barplot(height=emissions_annuelles$Emissions/1000, names.arg=emissions_annuelles$year, xlab="Year", ylab=expression('Aggregated Emission'),main=expression('Aggregated PM'[2.5]*' Emmissions by Year'), col = cols)
