# plot3.R
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
png("plot3.png", width = 480, height = 480)

# 3. Plot sub_metering_1
plot(
  data_subset$DateTime,
  data_subset$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)
# Add sub_metering_2 in red
lines(data_subset$DateTime, data_subset$Sub_metering_2, col = "red")
# Add sub_metering_3 in blue
lines(data_subset$DateTime, data_subset$Sub_metering_3, col = "blue")

# 4. Add a legend
legend(
  "topright",
  col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty = 1
)

# 5. Close the device
dev.off()
