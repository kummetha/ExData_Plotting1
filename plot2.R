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
png(filename="plot2.png")
plot(finalData$DateTime,finalData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()