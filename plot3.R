d <- read.csv(file = "household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
m <- subset(d, d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02"))
remove(d)
m$Time <- as.POSIXlt(paste(m$Date, m$Time, sep = " "))
#sapply(m, function (x){sum(is.na(x))})
png(filename = "plot3.png")
with(m, {
  plot(Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Time, Sub_metering_2, col = "red")
  lines(Time, Sub_metering_3, col = "blue")
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()