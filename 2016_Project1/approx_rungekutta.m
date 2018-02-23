%alpha - initial value, h - step size, a - lower bound, b - higher bound, f
%- function y'
function output = approx_rungekutta(alpha,h,a,b,f)

n = (b-a)/h; %Max step sizes, boundary of arrays
w(n+1) = 0.0; %Initializes w array to size n
w(1) = alpha; %Sets w0 to alpha or the initial value.
t(n+1) = 0.0; %Specifies at time.
t(1) = a; %Beginning time

for i=1:n
    k1 = h*f(t(i), w(i));
    k2 = h*f(t(i) + (h / 2), w(i) + (k1 / 2));
    k3 = h*f(t(i) + (h / 2), w(i) + (k2 / 2));
    k4 = h*f(t(i) + h, w(i) + k3);
    
    w(i+1) = w(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
    t(i+1) = a + i*h;
end

output(1:n+1,1) = t;
output(1:n+1,2) = w;