plot1 <- function() { 


source("LoadingData.r")

# first loadData 

data <- loadData()

## plot histogram of global active power for those 2 days
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

}