# Exploratory Data Analysis
# Course Project 1
# Part 3 - Code plot3.R for plot1.png

## Download file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "power.zip", method = "curl")
dateDownloaded <- date()

## Extract Data
unzip ("power.zip")
alldata <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header  = TRUE)

## Filter data
data <-  alldata[(alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007"), ]

## Format date and time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)

## Set up png file
png("plot3.png", width = 480, height = 480, units = "px")

## Make plot
plot(data$Sub_metering_1 ~ data$DateTime, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$Sub_metering_2 ~ data$DateTime, col = "red")
lines(data$Sub_metering_3 ~ data$DateTime, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Finalie png file
dev.off()