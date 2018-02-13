%Fixed-point Iteration

%This code was partly borrowed from my previous MATH/CSC 4210 Numerical Analysis
%II Class.
format long;
varlist = {'table','results','ans'};
clear(varlist{:}); %Makes clean re-execution of code.

%Initialization of variables
syms x;
f(x) = sym((1-x)*(3+x)^(1/2))/(3.06*(1+x)^(1/2)); %f(x) = x = ... = 0, Transformation of original function.
g(x) = diff(f(x),x); %Derivative of f.
%g(x) = f'(x), Computed.

%iterate through all possible roots.

%Side note: I picked 1 and got close to 0, so that's a big hint.
%With the transformation I did, I have to make sure x does not equal 0 or
%it will be undefined in accordance with the original function.
a = 0.3; %lower bound, Arbitrary. f(0.3) > 0.
b = 1.1; %upper bound, Arbitrary. f(1.1) < 0
alpha = a; %initial value or p0. Arbitrary. Usually is a.
k = double(abs(max(g(a), g(b)) )); %k = max(|f'(x)|), a <= x <= b, Computed. Constantly increasing on the interval.
eps = -7; %Degree of epsilon value, or 10^eps. Given.
n = int32(ceil(abs((eps*log(10))/(log(k))))); %Number of iterations. Computed.


%First value (rows) is number of iterations or n.
%Second value (columns) is types of relevant info. (n, p, f(p), etc.)
results(n:5) = 0; %initialize array,

columns = {'n', 'p(n)', '|p(n)-p(n-1)|', '|f(p(n))|'};

%BEGIN ALGORITHM
results = approx_fixedpt(alpha,n,a,b,f,eps);
%END
%Format Results
disp(strcat('Fixed Point Iteration, for n iterations: ', num2str(n)));
disp(columns);
disp(results);

disp('Absolute Error calculated using calculator: 3.967*10^-7');
