
# Set path
setwd("/R Workspace/ExploratoryAnalysis/CourseProject2/data")

#Read rds file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregate PM2.5 data by year
NEI_BaltimoreMaryland <- subset(NEI, fips == "24510")
total.emissions <- with(NEI_BaltimoreMaryland, aggregate(Emissions, by = list(year), sum))

#Plot total emmissions per year for each source.
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(total.emissions, type = "b", pch = 18,col = "blue", ylab = "Emissions", xlab = "Year", main = "Annual Emissions in Baltimore, Maryland")

dev.off()
