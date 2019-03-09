plot3 <- function() { 
  
  
  source("LoadingData.r")
  
  # first loadData 
  
  data <- loadData()
  
  ## plot globalactivepower vs date&time
  png("plot3.png", width=480, height=480)
  with(subsetdata, plot(FullTimeDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
  lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_2,type="l", col= "red")
  lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  dev.off()
  
}