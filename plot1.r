if (is.na(file.info("household_power_consumption.txt")$size)) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}
power <- read.csv("household_power_consumption.txt",sep=";",na.strings = "?", colClasses = "character")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power_sub <- subset(power, power$Date==as.Date("1/2/2007", "%d/%m/%Y") | power$Date==as.Date("2/2/2007", "%d/%m/%Y"))
power_sub$Global_active_power <- as.numeric(power_sub$Global_active_power)

png('plot1.png')
hist(power_sub$Global_active_power, col="red", ylim = c(0,1201), xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()