function  Euler_second_order

% Solving a differential equation by Euler's method

% 5.2 # 1(c) and 3(c)

% Input:     t0 = initial value for t

%            tn = stopping value for t

%            N = number of subintervals

%            y0 = initial value of y

%            F = the right hand side of the ODE system written 

%            in the standard form

% Output:    A plot of the computed solution y

N = input('N = '); w = zeros(N+1,1); t = zeros(N+1,1);

a = 1; b = 100; 

w(1) = 2;   

h = (b-a)/N;        % Compute spacing h

F = @(t,y) 1 + y./t;
E = @(t) t.*log(t) + 2*t;
w(1) = w
t(1) = a;

for k = 1:N
      w(k+1) = w(k) + h*F(t(k),w(k));  
      t(k+1) = t(k) + h;
end

tt = linspace(a,b,10000);

plot(t,w,'r*',tt,E(tt),'b-');

xlabel('t'), ylabel('y')

legend('Approximate Solution', 'Exact Solution', 'Location', 'NorthWest');

end

