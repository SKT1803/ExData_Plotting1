# plot1.R
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
png("plot1.png", width = 480, height = 480)

# 3. Create the histogram
hist(
  data_subset$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)

# 4. Close the device
dev.off()
