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

