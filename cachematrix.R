## Create functionality to return the inverse of a matrix
## with a cached solution returned if it exists

## Creates a matrix object that can cache its own inverse
makeCacheMatrix <- function(m = matrix()) {
  i <- NULL
  
  #Method to set matrix value
  set <- function(matrix) {
    m <<- matrix
    i <<- NULL
  }
  
  #Method to return matrix
  get <- function() {
    m
  }
  
  #Method to set the inverse property
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  #Method to return inverse property
  getInverse <- function() {
    i
  }
  
  #Retrn availale methods
  list (set =set, get= get,
        setInverse=setInverse,
        getInverse=getInverse)
}


## Return cached solution, or create new cache
cacheSolve <- function(x, ...) {
        
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
  #Return m if it is not empty
  if(!is.null(m)) {
    message("getting cached solution")
    return(m)
  }
  
  #Get matrix from object and calculate inverse
  data <- x$get()
  m<-solve(data)
  x$setInverse(m)
  m
}
