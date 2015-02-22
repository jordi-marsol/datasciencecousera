
# This function gets a matrix as input and stores it
# returns a list of its internal functions to set and get the data

makeCacheMatrix <- function(x = matrix()) {

    i <- NULL
    
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
    get <- function() {x}
    
    setinverse <- function(inverse) {i <<- inverse}
    getinverse <- function() {i}
    
    #(set is a $name type and second set is the variable, same with the rest)
    list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


# this function gets a cached matrix type
# and returns a matrix that is the inverse of 'x'
# if the inverse was previously calculed it will return 
# straight its value, if not, it solves its inverse and 
# sets its value to x and returns its value as well

cacheSolve <- function(x, ...) {
  
    i <- x$getinverse()
    
    if(!is.null(i)) {
      message("getting cached data")
      return(i)
    }
    
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}
