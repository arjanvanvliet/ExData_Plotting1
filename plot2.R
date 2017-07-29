# JHU - Data Science
# Module 4. Exploratory Data Analysis
# Week 1 Assignment - plot 2

library(dplyr)

# Load data
hhData <- read.csv2("./data/household_power_consumption.txt", dec = ".", na.strings = "?")

# Filter out data from the dates 2007-02-01 and 2007-02-02 and convert to Date
hhData <- subset(hhData, Date == "1/2/2007" | Date == "2/2/2007")
hhData <- mutate(hhData, DateTime = as.POSIXct(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %X")))

# Set the graphics device
png(filename = "plot2.png")

# Create the plot
with(hhData, plot(DateTime, Global_active_power, type = "l",
                  xlab = "",
                  ylab = "Global Active Power (kilowats)"))

# Close the PNG file
dev.off()
