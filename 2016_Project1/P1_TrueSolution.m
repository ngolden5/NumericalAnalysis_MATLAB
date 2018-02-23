%alpha - initial value, h - step size, a - lower bound, b - higher bound, f
%- function y'
function output = P1_TrueSolution(alpha,h,a,b)

n = (b-a)/h; %Max step sizes, boundary of arrays
w(n+1) = 0.0; %Initializes w array to size n
w(1) = alpha; %Sets w0 to alpha or the initial value.
t(n+1) = 0.0; %Specifies at time.
t(1) = a; %Beginning time

for i=1:n
    t(i+1) = a + i*h;
    w(i+1) = 2*exp(3*(t(i+1)-1));
end

output(1:n+1,1) = t;
output(1:n+1,2) = w;