pollutantmean<-function(directory, pollutant, id=1:332){
  directory <- paste(getwd(),"/",directory,"/",sep="")
  files.list<-list.files(directory)
  dat<-data.frame()
  for (i in id){
    dat<-rbind(dat, read.csv(paste(directory,files.list[i],sep="")))
  }
  mean(dat[,pollutant], na.rm=TRUE)
}

pollutantmean("specdata","sulfate",1:10)