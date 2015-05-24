rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  file <- read.csv("outcome-of-care-measures.csv",check.names=FALSE)
  
  col=which(tolower(names(file))==tolower(paste("Hospital 30-Day Death (Mortality) Rates from ",outcome,sep="")))
  if(length(col)==0)
    stop("invalid outcome")
  numr=num #no es pot reciclar la mateixa variable num pq en cada volta canviaria i falla el worst
  if(num=="best") numr=1
  
  
  states<-levels(file$State) 
  all<-matrix(ncol=2)
  
  for(state in states){ 
    w<-which(file[,"State"]==state)
    #if (length(w)==0) 
    
    a<-file[w,2]
    b<-file[w,col]
    
    r<-suppressWarnings(data.frame(a=a,b=as.numeric(as.character(b)),c=w)) #creo taula amb noms, Rates i el numid de la fila original, salta un warning avisant que apareixen NAs en la conversio
    r<-r[complete.cases(r),] #trec els casos NA
    
    k<-r[with(r,order(b,-c)),] #Aplico l'ordre a R segons el Rate i segons el idoriginal descendent
    k<-cbind(k,rank=1:nrow(k)) #afegeixo una columna al final amb el rank
    if(num=="worst") numr=nrow(k)  
    all<-rbind(all,c(as.character(k[as.numeric(numr),1]),state))
  }
  all <- all[-1,] #delete first NAs row
  colnames(all) <- c("hospital","state")
  as.data.frame(all)
}