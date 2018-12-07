# Integration Using Simpson's 1/3 Rule
### This algorithm will approximate the integral over a data set using Simpsons 1/3 rule and the trapizoidal rule if necessary
##### Limitations
  * This algorithm will show an error if the data inputted is not equally spaced with respect to the x axis
  * This algorithm will not work for functions, only data sets
  * If given an even number of data points the trapazoidal rule will be used on either the first or the last interval,
  depending on which will give the smaller error
##### Inputs
  * x-values of data set
  * coorosponding y-values of data set
##### Outputs
  * The approximated integral
