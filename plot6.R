# i have already dowloaded the zip file and unzip it in a directory
setwd("C:/Users/Ali TIMITE/Downloads/data science/4-exploratory data analysis/semaine4/exam-assignement/exdata_data_NEI_data")
library(tidyverse)

resume <- readRDS("summarySCC_PM25.rds") # import data as a variable
classification <- readRDS("Source_Classification_Code.rds")

vehicle.scc <- classification[grep("[Vv]eh", classification$Short.Name), ]  # search all vehicle source
emissions.motor.baltimore <- resume %>% subset(fips == "24510" & resume$SCC %in% vehicle.scc$SCC) %>% merge(y = vehicle.scc, by.x = "SCC", by.y = "SCC") %>% group_by(year) %>% summarize(Emissions = sum(Emissions, na.rm = TRUE))
emissions.motor.la <- resume %>% subset(fips == "06037" & resume$SCC %in% vehicle.scc$SCC) %>% merge(y = vehicle.scc, by.x = "SCC", by.y = "SCC") %>% group_by(year) %>% summarize(Emissions = sum(Emissions, na.rm = TRUE))

emissions.motor.baltimore2 <- cbind(emissions.motor.baltimore, "City" = rep("Baltimore", 4))
emissions.motor.la2 <- cbind(emissions.motor.la, "City" = rep("LA", 4))
emission_BaltLA <- rbind(emissions.motor.baltimore2, emissions.motor.la2)

emission_BaltLA.plot <- ggplot(emission_BaltLA, aes(year, Emissions, col= City)) + geom_point(size=4, alpha=1/3) + xlab("Year")+ylab("Total Emissions [Tons]")+ggtitle("BALTIMORE and LA annual vehicle Emissions")

emission_BaltLA.plot