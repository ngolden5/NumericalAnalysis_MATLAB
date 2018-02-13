%Newton's Method

%This code was partly borrowed from my previous MATH/CSC 4210 Numerical Analysis
%II Class.
%format long;
varlist = {'table','results','ans'};
clear(varlist{:}); %Makes clean re-execution of code.

%Initialization of variables
syms x;
%f(x) = sym( cos(x) - x);
f(x) = sym( cos(4*x*(1-x^2)^1/2)+(8*x^4)+(-8*x^2)+1 ); %f(x) = x = ... = 0, Transformation of original function.
g(x) = diff(f(x),x); %Derivative of f.
%g(x) = f'(x), Computed.

for i=1:4
a = [-1.0,-0.5,0.4,0.9]; %lower bound, Arbitrary. f(0) > 0.
b = [-0.9,-0.4,0.5,1.0]; %upper bound, Arbitrary. f(0.5) < 0
alpha = a(i); %initial value or p0. Arbitrary. Usually is a.
k = double(abs(max(g(a(i)), g(b(i))) )); %k = max(|f'(x)|), a <= x <= b, Computed. 
eps = -8; %Degree of epsilon value, or 10^eps. Given.
n = int32(ceil(abs((eps*log(10))/(log(k))))); %Number of iterations. Computed.


%First value (rows) is number of iterations or n.
%Second value (columns) is types of relevant info. (n, p, f(p), etc.)
results(n:5) = 0; %initialize array,

columns = {'n', 'p(n)','|p(n)-p(n-1)|', '|f(p(n))|'};

%BEGIN ALGORITHM
results = approx_newton(alpha,n,a(i),b(i),f,g,eps);
%END
%Format Results
disp(strcat('Newtons Method Iteration, for n iterations: ', num2str(n)));
disp(columns);
disp(results);


end
