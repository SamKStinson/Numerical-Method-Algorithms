%Function that uses Heun's Method with iteration to solve ordinary differential equations
function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%t and y = dependent variables (usually time and displacement)
%dydt = the first derivative of y with respect to t (user gives as anonymous
%function)
%tspan = the interval used to approximate value of dydt (user gives as [x,y])
%y0 = initial condition
%h = step size
%es = stopping criterion
%maxit = maximum number of iterations performed
if nargin>6 || nargin<4
    error('Must specifiy 4 to 6 input values')
elseif nargin==5
    maxit=50;
elseif nargin==4
    es=.001;
    maxit=50;
end

  t1 = tspan(1);
  t2 = tspan(2);
  t = (t1:h:t2)';
  u = length(t);
  
 % add an additional value of t if necessary 
  if t(u) < t2
    t(u+1) = t2;
    u = u + 1;
  end
  
  y= y0*ones(u,1); 
  iter = 0;
  ea = 100;
  
  for i = 1:u-1
    m0=dydt(t(i),y(i));
    y(i+1)=y(i)+m0*h;
    ea=100;
    iter=0;
    
    while ea>=es && iter<=maxit
      yold=y(i+1);
      m1= dydt(t(i+1),y(i+1));
      y(i+1)= y(i)+h*(m0+m1)/2;
      iter=iter+1;
      
      if y(i+1) > 0
        ea =abs((y(i+1)-yold)/y(i+1))*100;
      end
    end
  end
  plot(t,y)
end
