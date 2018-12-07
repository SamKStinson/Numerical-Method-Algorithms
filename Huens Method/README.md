# Ordinary Differential Equations with Heun's Method
### This algorithm will approximate the solution(s) to ordinary differential equations using Heun's Method with very good accuracy
##### Limitations
  * This algorithm is only designed to handle ordinary differential equations
##### Inputs
  1. dydt - An ordinary differential equation to be evaluated. The function must be anonymous (i.e. @(t,y) f(t,y))
  2. tspan - Your first and last values of t that you wish to be evaluated. Must be in the form [first,last]
  3. y0 - This is the initial value of y
  4. h - This is the step size you wish to use within your interval
  5. es - (optional input, will default to .001%) Stopping criterion. Once the function approximates a y-value within this percent error it will stop iterating for that t value and move to the next
  6. maxit - (optional input, will default to 50) The maximum number of iterations used to approximate any y-value
##### Outputs
  1. t-values
  2. Coorosponding y-values
