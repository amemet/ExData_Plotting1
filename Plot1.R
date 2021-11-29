
library(dplyr)
library(lubridate)

#downloading zip file
url_dataset<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url_dataset, "electric_consumption.zip")

#unzipping the folder
unzip("electric_consumption.zip")
list.files(path = "~/Coursera/R_Programming/Assignment2/ExData_Plotting1")

#reading the dataset
elcon<- read.table("~/Coursera/R_Programming/Assignment2/ExData_Plotting1/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#filter to include only two dates
elcon_s<- filter(elcon, Date == "1/2/2007" | Date == "2/2/2007" )

#changing the data type of the Date and Time:
elcon_s$Date <- as.Date(elcon_s$Date, format="%d/%m/%Y")

elcon_s$DateTime <- paste(elcon_s$Date, elcon_s$Time, sep=" ")

elcon_s$DateTime <- as_datetime(elcon_s$DateTime, format='%d/%m/%Y %H:%M:%S')

#Plotting plot1
png(filename = "~/Coursera/R_Programming/Assignment2/ExData_Plotting1/plot1.png", width=480, height=480)
hist(elcon_s$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
