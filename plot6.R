# Course Project2 - plot6.R

#Load Library
library(ggplot2)
#Set path
setwd("/R Workspace/ExploratoryAnalysis/CourseProject2/data")

#Read rds file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Extractin of any Vehicle from EI.Sector values for Baltimore & Los Angeles
SCC.MV<-SCC[grepl(pattern="vehicle", SCC$EI.Sector, ignore.case=TRUE),]$SCC
NIE.MV.Values<-subset(NEI, NEI$SCC %in% SCC.MV)
NIE.MV.Values<-subset(NIE.MV.Values, fips == "24510" | fips == "06037")

#Aggregate of emissions from vehicles of Balitmore & Los Angeles for each year
total.emissions <- with(NIE.MV.Values, aggregate(Emissions, by = list(fips,year), sum))
colnames(total.emissions) <- c( "City","Year", "Emissions")
total.emissions$City <- ifelse(total.emissions$City == "06037", "Los Angeles", "Baltimore")

#Plot graph
png(filename = "plot6.png", width = 480, height = 480, units = "px")
#qplot(Year, Emissions, data = total.emissions, color = Type, geom = c("point", "line")
qplot(Year, Emissions, data = total.emissions, geom = c("point", "line"), color = City , ylab = "Total "~ PM[2.5]~ " Emmission", main = "Motor Vehicle Source Emissions in Baltimore & LA over time")
dev.off()
