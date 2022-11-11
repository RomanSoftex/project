con <-file("./exdata_data_household_power_consumption/household_power_consumption.txt")
B<-readLines(con,n=1)
B1<-strsplit(B,";")
A<-grep('^[1-2]/2/2007',readLines(con),value=TRUE)
tf<-tempfile()
writeLines(A,tf)
df<-read.csv(tf,sep=";",head=FALSE,dec=".",stringsAsFactors=FALSE)
unlink(tf)

# print the names attribute of the B1 data set
names(B1)

names(df)[1:9]<-c("Date","Time","Global_active_power",
                  "Global_reactive_power","Voltage","Global_intensity",
                  "Sub_metering_1","Sub_metering_2","Sub_metering_3")

png(filename ="plot_.png",width = 480, height = 480, units = "px")
dev.off()

aa1<-df[,1]
bb1<-df[,2]
df$datatime<-strptime(paste(aa1,bb1,sep=" "),format="%d/%m/%Y %H:%M:%S")

library(datasets)
data(df)

with(df, plot(datatime, Global_active_power))

ggplot(data=df, aes(x=datatime, y=Global_active_power))
ggsave("plot1.png", width=480, height=480, units="px")

with(df, plot(Global_active_power, datatime))
png(filename ="plot_2.png",width = 480, height = 480, units = "px")
dev.off()

ggplot(data=df, aes(x=datatime, y=Global_active_power)) 



