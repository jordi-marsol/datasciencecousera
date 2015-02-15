pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

files <- list.files(directory)
for (i in 1:length(files)){
	file <- read.csv(paste(directory,"/",files[i],sep=""))
	#if (which(id==file[1,"ID"],arr.in=TRUE)!=0){
	  if (file[1,"ID"]==id){ #mean for one id only

		 pol<-file[,pollutant]
		meantot<-NULL
		 meantot<-append(meantot,mean(pol[complete.cases(pol)]))

		break
	}
}
		 print(mean(meantot))


}