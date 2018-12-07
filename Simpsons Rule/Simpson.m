%Function that integrates given data points with Simpson's 1/3 rule and
%Trapizoidal rule (if necessary)
function I = Simpson(x,y)
%I = estimated integral using Simpson's 1/3 rule and Trapizoidal rule (if necessary)
%x = values of the independant variables
%y = values of the dependant variables
%u = rows in x
%v = columns in x
%t = rows in y
%z = columns in y
%Y = sum of weighted elements multiplied by 4 and 2 when using Simpson's 1/3 rule
%h = total interval of integration used for Simpson's 1/3 rule
%hT = interval used for trapizoidal rule
%T = integral computed using the trapizoidal rule

[u,v]=size(x);
[t,z]=size(y);

%Checking that x and y are both row vectors
if u~=1 || t~=1
    error('x and y must both be row vectors')
elseif v~=z
    error('x and y must have same number of data points')
end

%Checking that the segments to be integrated are of equal length
k=diff(x);
if min(k)~=max(k)
    error('Intervals of x must be equal')
end




%Intializing Y
Y=0;

%If number of segments is even then only Simpson's 1/3 rule will be used
if mod(z,2)==1
h=(x(end)-x(1))/(v-1);

%For loop determines the value of Y
    for i=2:v-1
        if mod(i,2)==0
    Y=Y+4*y(i);
        else
    Y=Y+2*y(i);
        end 
    end
    
I=(h/3)*(y(1)+y(end)+Y);

%If # of segments is odd then the trapizoidal rule will be used on first or last segment
elseif abs(y(2)-y(1))>=abs(y(end)-y(end-1))
    
    %Trapizoidal rule will be used on last segment since error will be lower
    warning('Trapizoidal rule will be used on last segment')
    hT=x(end)-x(end-1);
    h=(x(end-1)-x(1))/(v-1);
    
    %For loop determines the value of Y
    for i=2:v-2
        if mod(i,2)==0
    Y=Y+4*y(i);
        else
    Y=Y+2*y(i);      
        end
    end
    
    %Adding Simpson's rule and Trapizoidal rule integral estimations
    T=hT*((y(end)+y(end-1))/2);
    I=(h/3)*(y(1)+y(end-1)+Y)+T;
    
%Using Trapizoidal rule on the first segment since error will be lower
else
    warning('Trapizoidal rule will be used on first segment')
    hT=x(2)-x(1);
    h=(x(end)-x(2))/(v-1); 
    
    for i=3:v-1
        if mod(i,2)==1
    Y=Y+4*y(i);
        else
    Y=Y+2*y(i);       
        end
    end
    
    %Adding Simpson's rule and Trapizoidal rule integral estimations
    T=hT*((y(1)+y(2))/2);
    I=(h/3)*(y(2)+y(end)+Y)+T;
end
end
