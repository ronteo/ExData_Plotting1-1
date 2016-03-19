if (is.na(file.info("household_power_consumption.txt")$size)) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}
power <- read.csv("household_power_consumption.txt",sep=";",na.strings = "?", colClasses = "character")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power_sub <- subset(power, power$Date==as.Date("1/2/2007", "%d/%m/%Y") | power$Date==as.Date("2/2/2007", "%d/%m/%Y"))
power_sub$Time <- strptime(paste(power_sub$Date, power_sub$Time), "%Y-%m-%d %H:%M:%S")
power_sub$Global_active_power <- as.numeric(power_sub$Global_active_power)

png('plot3.png')
plot(power_sub$Time, power_sub$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
points(power_sub$Time, power_sub$Sub_metering_1, type = "l")
points(power_sub$Time, power_sub$Sub_metering_2,col="red", type = "l")
points(power_sub$Time, power_sub$Sub_metering_3,col="blue", type = "l")
legend("topright", legend =  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch=c("-","-","-"), col=c("black","red","blue"))
dev.off()