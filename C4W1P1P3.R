# Week 1 Project: Plot 3
# Exploratory Data Analysis
# Udaya Tejwani
# 11/20/2018
###########################################

library("data.table")

setwd("C:\\Users\\Udaya\\Documents\\DataScience\\Course 4\\Project 1")

powerdata <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# convert the date variable to Date class

powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")



# Subset the data

powerdata <- subset(powerdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))



# Convert dates and times

powerdata$datetime <- strptime(paste(powerdata$Date, powerdata$Time), "%Y-%m-%d %H:%M:%S")



# Plot 3

powerdata$datetime <- as.POSIXct(powerdata$datetime)

attach(powerdata)

plot(Sub_metering_1 ~ datetime, type = "l", xlab = "", ylab = "Energy sub metering")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file = "plot3.png", height = 480, width = 480)

dev.off()

detach(powerdata)