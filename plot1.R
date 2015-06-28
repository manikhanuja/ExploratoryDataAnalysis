 Course Project 2 - Exploratory Data Analysis

#Load required libraries
library(data.table)

#Set path
setwd("/Users/manikhanuja/Documents/R Workspace/ExploratoryAnalysis/CourseProject2/data")

#Read rds file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregate PM2.5 data by year
total.emissions <- with(NEI, aggregate(Emissions, by = list(year), sum))

#Plot total emmissions per year for each source.
png(filename = "plot1.png", width = 480, height = 480, units = "px")
plot(total.emissions, type = "b", pch = 18,col = "blue", ylab = "Emissions", xlab = "Year", main = "Annual Emissions")
dev.off()
