## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = numeric()) {
  
  cache <- NULL
  setMatrix <- function(newValue) {
    x <<- newValue
    cache <<- NULL
  }
  
  getMatrix <- function() {
    x
  }
  
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  
  getInverse <- function() {
    cache
  }
  
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## This function calls the inverse of the special matrix created with above function makeCacheMatrix

cacheSolve <- function(y, ...) {
  inverse <- y$getInverse()
  
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  
  inverse
}
