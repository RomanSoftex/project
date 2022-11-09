library(zoo)
print(cat("start plot4 script ",date(),sep = " @ "))
#### read txt file into table
hhpc <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                   header = T, sep =";", 
                   stringsAsFactors = T)
## subset the table with Date = 1/2/2007 or 2/2/2007
hhpc_1 <- subset(hhpc,Date =="1/2/2007"| Date =="2/2/2007")
##
## prepare plot2 date time series for x axis 
xtimeseries <- strptime(paste(hhpc_1$Date,hhpc_1$Time),"%d/%m/%Y %H:%M:%S")
##
### setup 2 x 2 plot matrix
par(mfcol=c(2,2), mar=c(5,4,1,1))
##*****************************************************
## prepare plot #1
## prepare y axis data series
xdata<- as.numeric(as.character(hhpc_1$Global_active_power))
## build zoo plot series variable and plot
xplot <- zoo(xdata,xtimeseries)
##
plot(xplot,pch=20,ylab="",xlab="") 
title(ylab="Global Active Power (kilowatts)")
##
##******************************************************
##prepare plot #2
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
legend("topright", legend=c("Sub_metering_1         ",
                            "Sub_metering_2         ",
                            "Sub_metering_3         "),
       col=c("black","red","blue"), pch = "_",cex=0.5)
##
##*****************************************************
## prepare plot #3
## prepare y axis data series
vdata<- as.numeric(as.character(hhpc_1$Voltage))
## build zoo plot series variable and plot
vplot <- zoo(vdata,xtimeseries)
##
plot(vplot,pch=20,ylab="",xlab="") 
title(ylab="Voltage",xlab="datetime")
##
##*****************************************************
## prepare plot #4
## prepare y axis data series
gdata<- as.numeric(as.character(hhpc_1$Global_reactive_power))
## build zoo plot series variable and plot
gplot <- zoo(gdata,xtimeseries)
##
##
plot(gplot,pch=20,ylab="",xlab="",ylim=c(0,0.5)) 
title(ylab="Global Reactive Power",
      xlab="datetime")
##
## put composite plots in png file plot1.png
dev.copy(png,file="plot4.png",width=480, height=480)
dev.off()
##
print(cat("plot4 script completed",date(),sep = " @ "))
