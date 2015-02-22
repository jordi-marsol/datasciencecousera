
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
corvec<-NULL  
files <- list.files(directory)
for (i in 1:length(files)){ 
  file <- read.csv(paste(directory,"/",files[i],sep=""))
  
  #comp<-complete(directory)
  #if(comp[which(comp[,"id"]==i,arr.in=TRUE),"nobs"]>threshold){
  if (sum(complete.cases(file)) > threshold){
    corround<-round(cor(file[,"sulfate"],file["nitrate"],use="complete.obs"),digits = 5) 
    corvec <- append(corvec,corround)    
  }
}
corvec
}
