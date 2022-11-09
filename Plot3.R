library(zoo)
print(cat("start plot3 script ",date(),sep = " @ "))
##
## read txt file into table
hhpc <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                   header = T, sep =";", 
                   stringsAsFactors = T)
## subset the table with Date = 1/2/2007 or 2/2/2007
hhpc_1 <- subset(hhpc,Date =="1/2/2007"| Date =="2/2/2007")
##
## prepare plot2 date time series for x axis 
xtimeseries <- strptime(paste(hhpc_1$Date,hhpc_1$Time),"%d/%m/%Y %H:%M:%S")
## prepare y axis data series
xdata1<- as.numeric(as.character(hhpc_1$Sub_metering_1))
xdata2<- as.numeric(as.character(hhpc_1$Sub_metering_2))
xdata3<- as.numeric(hhpc_1$Sub_metering_3)
## build zoo plot series variable and plot
xplot1 <- zoo(xdata1,xtimeseries)
xplot2 <- zoo(xdata2,xtimeseries)
xplot3 <- zoo(xdata3,xtimeseries)
##
plot(xplot1,pch=20,ylab="",xlab="")     
lines(xplot2,pch=20,ylab="",xlab="",col="red") 
lines(xplot3,pch=20,ylab="",xlab="",col="blue") 
title(ylab="Energy Sub Metering")
legend("topright", legend=c("Sub_metering_1    ",
                            "Sub_metering_2    ",
                            "Sub_metering_3    "),
       col=c("black","red","blue"), pch = "_",cex=0.5)
##
## put plot in png file plot3.png
dev.copy(png,file="plot3.png",width=480, height=480)
dev.off()
##
print(cat("plot3 script completed",date(),sep = " @ "))
