%alpha - initial value, h - step size, a - lower bound, b - higher bound, f
%- function y'
function output = approx_adamspredcorrect(alpha,h,a,b,f)

n = (b-a)/h; %Max step sizes, boundary of arrays
w(n+1) = 0.0; %Initializes w array to size n
w(1) = alpha; %Sets w0 to alpha or the initial value.
t(n+1) = 0.0; %Specifies at time.
t(1) = a; %Beginning time
output(n+1,1) = 0;
output(1,1) = t(1);
output(n+1,2) = 0;
output(1,2) = w(1);


for i=1:3 %Runge-Kutta method, for values i = 1,2,3.
    k1 = h*f(t(i), w(i));
    k2 = h*f(t(i) + (h / 2), w(i) + (k1 / 2));
    k3 = h*f(t(i) + (h / 2), w(i) + (k2 / 2));
    k4 = h*f(t(i) + h, w(i) + k3);
    
    w(i+1) = w(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
    t(i+1) = a + i*h;
    
    if(i < n+1) %Keeps this part from going over the boundary if n is 3 or less.
    output(i+1,1) = t(i+1);
    output(i+1,2) = w(i+1);
    end
end

for i=4:n
    t_current = a + i*h;
    w_predict = w(4)+h*(55*f(t(4),w(4))-59*f(t(3),w(3))+37*f(t(2),w(2))-9*f(t(1),w(1)))/24;
    w_correct = w(4)+h*(9.0*f(t_current,w_predict)+19.0*f(t(4),w(4))-5.0*f(t(3),w(3))+f(t(2),w(2)))/24; 
%Save result
    output(i+1,1) = t_current;
    output(i+1,2) = w_correct;
%Shift right by 1.
for j = 1:3 
    t(j) = t(j+1);
    w(j) = w(j+1);
end
%Setup for next iteration.
 t(4) = t_current;
 w(4) = w_correct;
 
end
end
