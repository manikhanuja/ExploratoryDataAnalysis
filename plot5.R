# Course Project2 - plot5.R

#Load Library
library(ggplot2)
#Set path
setwd("/Users/manikhanuja/Documents/R Workspace/ExploratoryAnalysis/CourseProject2/data")

#Read rds file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Extractin of any Vehicle from EI.Sector values for Baltimore
SCC.MV<-SCC[grepl(pattern="vehicle", SCC$EI.Sector, ignore.case=TRUE),]$SCC
NIE.MV.Values<-subset(NEI, NEI$SCC %in% SCC.MV & fips == "24510")

#Aggregate of emissions from vehicles for each year
total.emissions <- with(NIE.MV.Values, aggregate(Emissions, by = list(year), sum))
colnames(total.emissions) <- c( "Year", "Emissions")

#Plot graph
png(filename = "plot5.png", width = 480, height = 480, units = "px")
qplot(Year, Emissions, data = total.emissions, geom = "line", ylab = "Total "~ PM[2.5]~ " Emmission", main = "Motor Vehicle Source Emissions in Baltimore from 1999-2008")
dev.off()
