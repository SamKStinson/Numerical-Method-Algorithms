%False position algorithm for finding roots of a function
function [root,fx,ea,iter]= falseposition(func,xl,xu,es,maxiter)

%root= the estimate of the zero of the function
%fx= the value of the function at the root location
%ea= approximate relative error
%iter= number of iterations performed
%func= the function being evaluated (Must be in the form of an annonymous function, '@x (function)')
%xl= the lower guess
%xu= the upper guess
%es= the desired relative error
%maxiter= the desired number of iterations

guess= func(xl)*func(xu); %checking that bounds bracket the root
if guess>0
    error('guesses must bracket a root')
end

if nargin==4 %maxiter and es are 200 and .0001 respectively unless assigned
    maxiter=200;
elseif nargin==3
    maxiter=200;
    es=.0001;
elseif nargin<3
    error('must assign variables "func", "xl", and "xu"')
end

%Assigning starting values to variables
 iter=1; ea=100; xr=xl;
 
 %Iterate false position until a stopping criteria is met
 while iter<=maxiter && ea>=es
     xrold=xr;
     iter=iter+1;
     xr=xu-(func(xu)*(xl-xu))/(func(xl)-func(xu)); %False position equation
     if iter>=1
         ea=abs(((xr-xrold)/xr)*100); %value of relative error
     else
         ea=100; %error is 100% on first iteration
     end
     
     %Replacing the upper or lower bound with xr depending on the function
     if ea>=es && iter<=maxiter && func(xr)*func(xu)>0
         xu=xr;
     elseif func(xr)*func(xl)>0
         xl=xr;
     end   
 end
root=double(xr);
fx=double(func(xr));
iter=double(iter);
ea=double(ea);
end
