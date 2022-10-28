corr <- function(directory, threshold=0){
  
  #List of all csv files
  filelist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  
  #Vector for values to be input into
  cor_vector <- numeric()
  
  #Loop for each file in list
  for (i in 1:length(filelist)) {
    data <- read.csv(filelist[i])
    
    cc <- sum(complete.cases(data))
    
    if (cc > threshold){
      
      dataN <- data[complete.cases(data[c('sulfate', 'nitrate')]),]
      
      cor_vector <- c(cor_vector, cor(dataN$sulfate, dataN$nitrate))
      
    }
    
  }
  
  cor_vector
  
}
