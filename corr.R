corr <- function(directory, threshold = 0){
  
  csvId <- list.files(paste(getwd(),"/",directory, sep = ""), pattern = "*.csv")
  
  completeCases <- complete(directory)
  
  csvForLoop <- csvId[completeCases["nobs"]>threshold]
  
  result <- c()
  
  for(val in csvForLoop){
    
    dataTemp <- read.csv(paste(directory,"/",val, sep = ""))
    
    dataTemp2 <- dataTemp[complete.cases(dataTemp),]
    
    resultTemp <- cor(dataTemp2["nitrate"],dataTemp2["sulfate"])
    
    result <- append(result,resultTemp[1,1])
    
  }
  result
}