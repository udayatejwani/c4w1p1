# Week 1 Project: Plot 1
# Exploratory Data Analysis
# Udaya Tejwani
# 11/20/2018
###########################################

library("data.table")

setwd("C:\\Users\\Udaya\\Documents\\DataScience\\Course 4\\Project 1")

#Reads in data from file then subsets data for specified dates
powerdata <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Prevents histogram from printing in scientific notation
powerdata[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type
powerdata[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
powerdata <- powerdata[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
attach(powerdata)

hist(powerdata[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
detach(powerdata)