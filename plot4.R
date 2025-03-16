# plot4.R
# 1. Read and subset the data
data_full <- read.csv("household_power_consumption.txt", 
                      sep = ";", 
                      header = TRUE, 
                      na.strings = "?", 
                      stringsAsFactors = FALSE)
data_subset <- subset(data_full, Date == "1/2/2007" | Date == "2/2/2007")
data_subset$DateTime <- strptime(
  paste(data_subset$Date, data_subset$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

# 2. Open a PNG file device
png("plot4.png", width = 480, height = 480)

# 3. Set up a 2x2 layout
par(mfrow = c(2, 2))

# -- Plot (1) Global Active Power
plot(
  data_subset$DateTime,
  data_subset$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power"
)

# -- Plot (2) Voltage
plot(
  data_subset$DateTime,
  data_subset$Voltage,
  type = "l",
  xlab = "datetime",
  ylab = "Voltage"
)

# -- Plot (3) Sub Metering
plot(
  data_subset$DateTime,
  data_subset$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)
lines(data_subset$DateTime, data_subset$Sub_metering_2, col = "red")
lines(data_subset$DateTime, data_subset$Sub_metering_3, col = "blue")
legend(
  "topright",
  bty = "n",            # no legend box border
  col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty = 1
)

# -- Plot (4) Global Reactive Power
plot(
  data_subset$DateTime,
  data_subset$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global Reactive Power"
)

# 4. Close the device
dev.off()
