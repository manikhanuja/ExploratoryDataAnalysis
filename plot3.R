 Course Project 2 - Exploratory Data Analysis: plot3.R
#Load Library
library(ggplot2)
#Set path
setwd("/R Workspace/ExploratoryAnalysis/CourseProject2/data")

#Read rds file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregate PM2.5 data by type and year
NEI_BaltimoreMaryland <- subset(NEI, fips == "24510")
total.emissions <- with(NEI_BaltimoreMaryland, aggregate(Emissions, by = list(type,year), sum))
colnames(total.emissions) <- c("Type", "Year", "Emissions")

#Plot total emmissions in Baltimore, Maryland by Type of Pollutant.
png(filename = "plot3.png", width = 480, height = 480, units = "px")
qplot(Year, Emissions, data = total.emissions, color = Type, geom = c("point", "line"), main = "Total Emissions in Baltimore, Maryland by Type of Pollutant")
dev.off()
