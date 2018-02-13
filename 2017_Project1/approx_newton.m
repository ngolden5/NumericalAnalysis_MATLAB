%alpha - initial value, h - step size, a - lower bound, b - higher bound, f
%- function y'
function output = approx_newton(alpha,n,a,b,f,g,eps)

%n = Max step sizes, boundary of arrays
iter(n+1) = 0; %Initializes iter array to size n with some space. Good.
iter(1) = 1; %Used for numbering iterations. Good.
h(n+1) = 0.0; %Initializes g array to size n with some space. Good.
h(1) = alpha; %sets p0 to alpha or the initial value. Good.

d(n+1) = 0.0; %|pn - pn-1| initialization
d(1) = 0.0; %There's no value at this point.
e(n+1) = 0.0;
e(1) = abs(f(g(1))); %|f(pn)|, n = 1

%iter is the iteration number, h is the value at that iteration.
%Easy conversion: pn ==> pn+1 ==> h(i+1). h(i) == pn-1.
for i=1:n
    iter(i+1) = i+1; % used for numbering. The iter is arbitrary.
    
    h(i+1) = h(i) - (f(h(i))/g(h(i))); %"The Newton Method". The meat of it.
    
    d(i+1) = abs( h(i+1) - h(i) );
    e(i+1) = abs(f(h(i+1)));
    
    check = double( max( d(i+1), e(i+1))); 
    if(check  < (10^eps))
        disp(strcat('Epsilon satisfied at iteration: ', num2str(i+1)));
        break;
    end
    
end

output(1:n+1,1) = iter;
output(1:n+1,2) = h;
output(1:n+1,3) = d; %|p(n)-p(n-1)|
output(1:n+1,4) = e; %|f(p(n))|
