## Put comments here that give an overall description of what your
## functions do?

## caching the inverse of a matrix.
## Matrix inversion is usually a costly computation and there may be 
## some benefit to caching the inverse of a matrix rather than compute
## it repeatedly.
## Here is a pair of functions that cache the inverse of a matrix.


## Write a short comment describing this function
## create a "special matrix" to cache the inverse of the matrix.


makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y					#"<<-"在目前的環境指定該變數
                m <<- NULL
        }
        get <- function() x				#get是一個function代表x
        setinv <- function(mean) m <<- mean		
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## Write a short comment describing this function
## caculate the inverse of the "special matrix" above,
## it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the data and sets the value of 
## the inverse in the cache via the setinv function.


cacheSolve <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}
 ## Return a matrix that is the inverse of 'x'





