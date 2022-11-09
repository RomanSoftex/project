library(zoo)
print(cat("start plot2 script ",date(),sep = " @ "))
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
xdata<- as.numeric(as.character(hhpc_1$Global_active_power))
## build zoo plot series variable and plot
xplot <- zoo(xdata,xtimeseries)
##
plot(xplot,pch=20,ylab="",xlab="") 
title(ylab="Global Active Power (kilowatts)")
##
## put plot in png file plot2.png
dev.copy(png,file="plot2.png",width=480, height=480)
dev.off()
##
