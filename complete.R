complete <- function(directory, id = 1:332){
  
  csvId <- list.files(paste(getwd(),"/",directory, sep = ""), pattern = "*.csv")
  
  mytempdata <- data.frame(id = character(), nobs = character())
  
  for (val in csvId[id]){
    
    completetemp <- sum(complete.cases(read.csv(paste(directory,"/",val, sep = ""))))
    
    mytempdata <- rbind(mytempdata,data.frame(id = match(val,csvId), nobs = completetemp))
    
  }
  
  mytempdata
  
}