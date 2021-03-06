plot4 <- function() { 
  
  
  source("LoadingData.r")
  
  # first loadData 
  
  data <- loadData()
  
  ## plot the 4 graphs
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  with(subsetdata, plot(FullTimeDate, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
  with(subsetdata, plot(FullTimeDate, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
  with(subsetdata, plot(FullTimeDate, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
  lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_2,type="l", col= "red")
  lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  with(subsetdata, plot(FullTimeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
  dev.off()
  
}