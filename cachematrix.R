## These two functions cache the inversion of a matrix

## The first makeCacheMatrix create a list cointanin functions
## that set and get the value of the matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
        inver <- NULL
        set <- function(y) {
          x <<- y
          inver <<- NULL
        }
          get <- function() x
          setinverse <- function(inverse) inver <<- inverse
          getinverse <- function() inver
          list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## The second cacheSolve function return the matrix. If the inverse 
## has been already computed gets the result, otherwise it compute the 
## inverse with seinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inver <- x$getinverse()
        if(!is.null(inver)) {
        message("getting cached data.")
        return(inver)
      }
        data <- x$get()
        inver <- solve(data)
        x$setinverse(inver)
        inver
}
