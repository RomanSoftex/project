
print(cat("start plot1 script ",date(),sep = " @ "))
##
## read txt file into table
hhpc <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                   header = T, sep =";", 
                   stringsAsFactors = T)
## subset the table with Date = 1/2/2007 or 2/2/2007
hhpc_1 <- subset(hhpc,Date =="1/2/2007"| Date =="2/2/2007")
##
## prepare plot1 vector for kilowatts
plot1 <- as.numeric(as.character(hhpc_1$Global_active_power))
##
##plot histogram
hist(plot1, col="red", 
     xlab="Global Active Power(kilowatts)",
     main="Global Active Power",
     ylim=c(0,1200))
## , xlim=c(0,6),breaks = 12)
##
## put plot in png file plot1.png
dev.copy(png,file="plot1.png",width=480, height=480)
dev.off()
##
print(cat("plot1 script completed",date(),sep = " @ "))