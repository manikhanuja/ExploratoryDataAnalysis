# Course Project2 - plot4.R

#Load Library
library(ggplot2)
#Set path
setwd("/Users/manikhanuja/Documents/R Workspace/ExploratoryAnalysis/CourseProject2/data")

#Read rds file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Extractin Coal & Combustion values
SCC.Combustion<-grepl(pattern = "comb", SCC$SCC.Level.One, ignore.case = TRUE)
SCC.Coal<-grepl(pattern = "coal", SCC$SCC.Level.Four, ignore.case = TRUE)
SCC.Coal.Combustion<-SCC[SCC.Combustion & SCC.Coal,]$SCC
NIE.Coal.Combustion.Values<-NEI[NEI$SCC %in% SCC.Coal.Combustion,]

#Aggregate of emissions from Coal & Combustion related sources for each year
total.emissions <- with(NIE.Coal.Combustion.Values, aggregate(Emissions, by = list(year), sum))
colnames(total.emissions) <- c( "Year", "Emissions")

#Plot graph for showing trend
png(filename = "plot4.png", width = 480, height = 480, units = "px")
qplot(Year, Emissions, data = total.emissions, geom = "line" ,width=0.75, ylab = "Total "~ PM[2.5]~ " Emmission", main = "Coal Combustion Source Emissions Across US from 1999-2008")
dev.off()
