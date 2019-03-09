plot2 <- function() { 
  
  
  source("LoadingData.r")
  
  # first loadData 
  
  data <- loadData()
  
  ## plot globalactivepower vs date&time
  png("plot2.png", width=480, height=480)
  with(data, plot(data$FullTimeDate, data$Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
  dev.off()
  
}