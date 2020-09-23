pollutantmean <- function(directory, pollutant, id= 1:332){
  workDir <- setwd(directory)
  csvId <- list.files(pattern = "*.csv")
  meanTot <- 0
  for (val in csvId[id]) {
    data<-read.csv(val)
    dataClean<-data[complete.cases(data[,pollutant]),]
    meanSingle <- mean(dataClean[,pollutant])
    if(is.nan(meanSingle)){meanTot <- meanTot+meanSingle}
  }
  meanTot/length(csvId[id])
}


