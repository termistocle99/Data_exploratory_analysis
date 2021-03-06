# i have already dowloaded the zip file and unzip it in a directory

setwd("C:/Users/Ali TIMITE/Downloads/data science/4-exploratory data analysis/semaine4/exam-assignement/exdata_data_NEI_data")
library(tidyverse)

classification <- readRDS("Source_Classification_Code.rds") 
resume <- readRDS("summarySCC_PM25.rds")

baltimore_emissions <- filter(resume, resume$fips=="24510") # filter resume to find baltimore only values
baltimore_year_em <- aggregate(Emissions ~year, baltimore_emissions, sum) # aggregate values by year

cols1 <- c("black", "blue", "darkcyan", "lightblue")  # set colors for barplot
barplot(height=baltimore_year_em$Emissions/1000, names.arg=emissions_annuelles$year, xlab="Year", ylab=expression('Aggregated Emission'),main=expression('Baltimore PM'[2.5]*' Emmissions by Year'), col = cols1) # bar plotting for baltimore