rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  file <- read.csv("outcome-of-care-measures.csv",check.names=FALSE)
  
  w<-which(file[,"State"]==state)
  if (length(w)==0) 
    stop("invalid state")
  
  col=which(tolower(names(file))==tolower(paste("Hospital 30-Day Death (Mortality) Rates from ",outcome,sep="")))
  if(length(col)==0)
    stop("invalid outcome")
  if(num=="best") num=1
  
  a<-file[w,2]
  b<-file[w,col]

  r<-suppressWarnings(data.frame(a=a,b=as.numeric(as.character(b)),c=w)) #creo taula amb noms, Rates i el numid de la fila original, salta un warning avisant que apareixen NAs en la conversio
  r<-r[complete.cases(r),] #trec els casos NA

  k<-r[with(r,order(b,-c)),] #Aplico l'ordre a R segons el Rate i segons el idoriginal descendent
  k<-cbind(k,rank=1:nrow(k)) #afegeixo una columna al final amb el rank
  if(num=="worst") num=nrow(k)
  as.character(k[as.numeric(num),1])
}