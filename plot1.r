
power <- read.csv("household_power_consumption.txt",sep=";",na.strings = "?", colClasses = "character")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power_sub <- subset(power, power$Date==as.Date("1/2/2007", "%d/%m/%Y") | power$Date==as.Date("2/2/2007", "%d/%m/%Y"))
power_sub$Time <- strptime(paste(power_sub$Date, power_sub$Time), "%Y-%m-%d %H:%M:%S")
power_sub$Global_active_power <- as.numeric(power_sub$Global_active_power)
hist(power_sub$Global_active_power, col="red", ylim = c(0,1201), xlab = "Global Active Power (kilowatts)", main="Global Active Power")