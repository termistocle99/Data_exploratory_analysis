# i have already dowloaded the zip file and unzip it in a directory
setwd("C:/Users/Ali TIMITE/Downloads/data science/4-exploratory data analysis/semaine4/exam-assignement/exdata_data_NEI_data")
library(tidyverse)

resume <- readRDS("summarySCC_PM25.rds") # import data as a variable
classification <- readRDS("Source_Classification_Code.rds")

vehicle.scc <- classification[grep("[Vv]eh", classification$Short.Name), ]  # search all vehicle source
emissions.motor.baltimore <- resume %>% subset(fips == "24510" & resume$SCC %in% vehicle.scc$SCC) %>% merge(y = vehicle.scc, by.x = "SCC", by.y = "SCC") %>% group_by(year) %>% summarize(Emissions = sum(Emissions, na.rm = TRUE))

cols3 <- c("purple","gray","brown", "steel blue") #set palet of colour

barplot(emissions.motor.baltimore$Emissions, names.arg=emissions.motor.baltimore$year, main= "Baltimore PM2.5 Emissions from Vehicle", ylab= "Emissions (Hundred of Tons)", xlab= "Year", col= cols3)
# bar plotting 
