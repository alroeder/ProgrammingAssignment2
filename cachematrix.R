#These two functions are used to compute the inverse of a matrix and save/retrieve it to the cache

#This function creates a special "matrix" object and caches its inverse.
makeCacheMatrix <- function(x = matrix()) {
  im <- NULL #variable to store inverse (initialised with NULL)
  set <- funtcion(y){
    x <<- y #saves matrix into superior environment
    im <<- NULL
  }
  get <- function() x #get original matrix
  setinverse <- function(inverse) im <<- inverse #set inverse
  getinverse <- function() im  #get/return inverse
  list(set = set, get = get,  #list of values of the makeCacheMatrix
       setinverse = setinverse,
       getinverse = getinverse)
  }


#The cacheSolve function checks if the inverse of a special matrix has already been calculated in makeCacheMatrix
#if yes, it retrieves the (already computed) inverse of the matrix from cache, otherwise it
#computes the inverse, saves it to cache and returns it
cacheSolve <- function(x, ...) {
  im <- x$getinverse() #gets "value" of inverse from makeCacheMatrix
  if(!is.null(im)) {  #if "value" of inverse is not NULL...message and
    message("getting cached data")
    return(im)  #returns cached inverse via makeCacheMatrix
  }
  data <- x$get() #getting the original matrix because im = NULL (no inverse in cache) 
  im <- solve(data, ...) #computing the inverse of the matrix
  x$setinverse(im) #saves inverse to cache
  im  	#prints inverse
}
