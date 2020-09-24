pollutantmeanMerge <- function(directory, pollutant, id= 1:332){
  workDir <- setwd(paste(getwd(),"/",directory,sep=""))
  csvId <- list.files(pattern = "*.csv")
  mytempdata <- data.frame("Date" = 0, "sulfate"=0, "nitrate"= 0,"ID"=0)  
  for (val in csvId[id]) {
    mytempdata <- rbind(mytempdata,read.csv(val))
  }
  
  dataClean<-mytempdata[complete.cases(mytempdata[,pollutant]),]
  
  mean(dataClean[-1,pollutant])
  
}