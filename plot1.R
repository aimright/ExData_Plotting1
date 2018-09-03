# Exploratory Data Analysis
# Course Project 1
# Part 1 - Code plot1.R for plot1.png

## Download file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "power.zip", method = "curl")
dateDownloaded <- date()

## Extract Data
unzip ("power.zip")
alldata <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header  = TRUE)

## Filter data
data <-  alldata[(alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007"), ]

## Set up png file
png("plot1.png", width = 480, height = 480, units = "px")

## Make plot
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

## Finalie png file
dev.off()