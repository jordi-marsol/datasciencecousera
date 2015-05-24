best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
  file <- read.csv("outcome-of-care-measures.csv",check.names=FALSE)
  
  w<-which(file[,"State"]==state)
  if (length(w)==0) 
    stop("invalid state")
  
  #col=which(tolower(names(file))==tolower(paste("Hospital.30.Day.Death..Mortality..Rates.from.",gsub(" ",".",outcome),sep=""))) #sense el checknames=false
  col=which(tolower(names(file))==tolower(paste("Hospital 30-Day Death (Mortality) Rates from ",outcome,sep="")))
  if(length(col)==0)
    stop("invalid outcome")
  
    min<-1000
    h<-""
    for(i in w){ 
      if (file[i,col]!="Not Available"){
        val <- as.numeric(as.character(file[i,col]))
        if(val < min) {
          min<-val
          h<-file[i,2]
        }
      }
      #min(as.numeric(as.character(file[w,col][file[w,col]!="Not Available"]))
    }
  
  as.character(h)
}