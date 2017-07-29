# JHU - Data Science
# Module 4. Exploratory Data Analysis
# Week 1 Assignment - plot 1

# Load data
hhData <- read.csv2("./data/household_power_consumption.txt", dec = ".", na.strings = "?")

# Filter out data from the dates 2007-02-01 and 2007-02-02
hhData <- subset(hhData, Date == "1/2/2007" | Date == "2/2/2007")

# Set the graphics device
png(filename = "plot1.png")

# Create the plot
hist(hhData$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowats)",
     col = "red")

# Close the PNG file
dev.off()
