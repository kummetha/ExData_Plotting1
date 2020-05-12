fileName <- "household_power_consumption.txt"
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists("household_power_consumption.txt")) 
{
  download.file(fileUrl, destfile = "exdata_data_household_power_consumption.zip" )
  unzip("exdata_data_household_power_consumption.zip")
}

data <- read.table(fileName, header = TRUE, sep = ";", stringsAsFactors=FALSE)
dates <- c("1/2/2007","2/2/2007")
data <- data[data$Date %in% dates,]
data[,3:9] <- sapply(data[,3:9],as.numeric)
finalData <- data.frame(DateTime=strptime(paste(data$Date,data$Time,sep=" "),format = "%d/%m/%Y %T"),data[,3:9])
png(filename="plot3.png")
with(finalData, {
       plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab="Energy sub metering")
       lines(DateTime, Sub_metering_2, col = "red")
       lines(DateTime, Sub_metering_3, col = "blue")
       })
legend("topright", lty=1,col = c("black","red","blue"), 
       legend = names(finalData[,6:8]))
dev.off()