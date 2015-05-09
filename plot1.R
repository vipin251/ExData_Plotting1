## R script to read and plot a histogram of Global active power from "household_power_consumption.txt"
## from your working direcoty. R script will save the plot1.png in your working directory 

## keep household_power_consumption.txt in your working directory

#read "household_power_consumption.txt" for the dates 2007-02-01 and 2007-02-02 as per project 1 
#submission requirement
data <- read.table("household_power_consumption.txt", sep = ";",
                   header= TRUE, skip = 66636, nrows = 2880, na.strings = "?")
#read the txt file once again the get the names and assign it to data
names(data) <- names(read.table("household_power_consumption.txt", sep = ";",
                                header= TRUE, nrows = 1 ))
# Create a new date time column
data$datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#Plot histogram of Global_active_power for two days and save it as plot1.png (480 x 480 pixels) in your 
# working direcotory
# Default values for png function output are (width = 480, height = 480, units = "px")
png(filename = "plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Glabal Active Power (kilowats)",
     main = "Global Active Power")
dev.off()
