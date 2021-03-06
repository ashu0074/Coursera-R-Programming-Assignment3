## This is week3 assignemt of Coursera Data Science: R Programming 
## github- ashu0074

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {                 ## it can define argument with default mode of the matrix
inv <- NULL                                                 ## intialize the inv as null(empty);will hold the value of matrix inverse
set <- function(y){                                         ## define the set function in y                      
    x<<-y                           ##value of the object in an environment different from Current evironment/(the value of matrix in parent environment)
    inv<<- NULL                     ## if there is new matrix then ,reset the inv again to null
}
get <- function() x                                      ## define the get function-return the value of matrix argument
setinv <- function(invrs) inv <<- invrs                  ## assign the value of inv in the parent enviornment
getinv <- function() inv                                 ## here get the value of inv when it call
list(set=set, get=get, setinv = setinv, getinv=getinv)   ##we need this order to refer to function with $ operator
}





## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then cacheSolve will retrieve the inverse from the cache


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  inv <- x$getinv()  
  
  # check if the inverse is calculated
  if (is.null(inv)){
  
    #if not then calculate the inverse 
    mat.data = x$get()
    inv = solve(mat.data, ...)
    
    # sets the value of the inverse in the cache via the setinv function.
    x$setinv(inv)
    
    return(inv)
     
  }
  
  # else get it from the cache and skips the computation. 
  message("getting cached data")
  
  return(inv)
}

# m <- matrix(rnorm(16),4,4)
#m1 <- makeCacheMatrix(m)
#cacheSolve(m1)

##          [,1]       [,2]      [,3]       [,4]
##[1,]  3.763117  -5.054690  4.656877 -15.280403
##[2,]  2.411792  -3.134740  0.822332  -7.329274
##[3,]  7.239438 -10.933399  3.692578 -24.733225
##[4,] -2.843980   4.649941 -1.112022  10.759952
