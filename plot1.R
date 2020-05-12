fileName <- "household_power_consumption.txt"
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists("household_power_consumption.txt")) 
{
  download.file(fileUrl, destfile = "exdata_data_household_power_consumption.zip" )
  unzip("exdata_data_household_power_consumption.zip")
}


data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
dates <- c("1/2/2007","2/2/2007")
data <- data[data$Date %in% dates,]
data[,3:9] <- sapply(data[,3:9],as.numeric)
png(filename="plot1.png")
hist(data$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()