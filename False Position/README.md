# False Position
### This algorithm will approximate a root of a given function using false position
##### Limitations
  * This will only work when given a function of a single variable
  * This will not work if given a data set
##### Inputs
  1. func - The function to find root of. Must be called anonymously (i.e. @(x) f(x))
  2. xl - This is a lower guess at the root, it does not have to be very accurate
  3. xu - This is an upper guess at the root, it also does not have to be very accurate
  4. es - (optional input, defaults to .001%) Stopping criterion. Once the root approximation gets within this accuracy the algorthim will stop
  5. maxit - (optional input, defaults to 50) The maximum number of iterations the algorithm will use before stopping
##### Outputs
  * root - The x-value at which the root occurs
  * fx - (optional) The approximated y-value at the root
  * ea - (optional) The approxiamte relative error
  * iter - (optional) The number of iterations performed
