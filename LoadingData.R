loadData  <- function(){


destfile="household_power_consumption.txt" 
zipfile = "consumption.zip"
fileURL <-
  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"   

if (!file.exists(destfile) & !file.exists(zipfile) )
{
      
      download.file(fileURL ,zipfile,method="auto") 
      unzip(zipfile)

}

## check if the Data already loaded before or not , if not will load it and get subset in global variable
if(!exists("subsetdata"))
{
  powerdata <- read.table(destfile, stringsAsFactors = FALSE, header = TRUE, sep =";"  )
  
  FullTimeDate <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  powerdata <- cbind(powerdata, FullTimeDate)
  
  ## change class of all columns to correct class
  powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
  powerdata$Time <- format(powerdata$Time, format="%H:%M:%S")
  powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
  powerdata$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power)
  powerdata$Voltage <- as.numeric(powerdata$Voltage)
  powerdata$Global_intensity <- as.numeric(powerdata$Global_intensity)
  powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
  powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
  powerdata$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)

  ## subset data from 2007-02-01 and 2007-02-02
  subsetdata <<- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")
 
}
 
  return(subsetdata)
 

}
