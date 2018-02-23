%alpha - initial value, h - step size, a - lower bound, b - higher bound, f
%- function y'
function output = approx_modeuler(alpha,h,a,b,f)

n = (b-a)/h; %Max step sizes, boundary of arrays
w(n+1) = 0; %Initializes w array to size n
w(1) = alpha; %Sets w0 to alpha or the initial value.
t(n+1) = 0; %Specifies at time.
t(1) = a; %Beginning time

for i=1:n
    t(i+1) = a + i*h;
    w(i+1) = w(i) + (h/2)*(f(t(i), w(i)) + f( t(i+1), w(i) + h*f(t(i), w(i)) ));
end

output(1:n+1,1) = t;
output(1:n+1,2) = w;