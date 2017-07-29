# JHU - Data Science
# Module 4. Exploratory Data Analysis
# Week 1 Assignment - plot 4

library(dplyr)

# Load data
hhData <- read.csv2("./data/household_power_consumption.txt", dec = ".", na.strings = "?")

# Filter out data from the dates 2007-02-01 and 2007-02-02 and convert to Date
hhData <- subset(hhData, Date == "1/2/2007" | Date == "2/2/2007")
hhData <- mutate(hhData, datetime = as.POSIXct(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %X")))

# Set the graphics device
png(filename = "plot4.png")

# Create the plot
par(mfcol = c(2, 2))
# Add plot 1
with(hhData, plot(datetime, Global_active_power, type = "l",
                  xlab = "",
                  ylab = "Global Active Power"))
# Add plot 2
with(hhData, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(hhData, lines(datetime, Sub_metering_2, col = "red"))
with(hhData, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "blue", "red"), lty = c(1, 1, 1), bty = "n",
       legend = c("Sub_meterging_1", "Sub_meterging_2", "Sub_meterging_3"))

# Add plot 3 and 4
with(hhData, plot(datetime, Voltage, type = "l"))
with(hhData, plot(datetime, Global_reactive_power, type = "l"))

# Close the PNG file
dev.off()
