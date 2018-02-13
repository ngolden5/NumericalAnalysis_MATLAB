%Fixed-point Iteration

%This code was partly borrowed from my previous MATH/CSC 4210 Numerical Analysis
%II Class.
format long;
varlist = {'table','results','ans'};
clear(varlist{:}); %Makes clean re-execution of code.

%Initialization of variables
f = inline('-1/(x^2-9)','x'); %f(x) = x = ... = 0, Given.
g = inline('2*x/(x^2-9)^2'); %g(x) = f'(x), Computed. Used WolframAlpha.

%Side note: I picked 1 and got close to 0, so that's a big hint.
%With the transformation I did, I have to make sure x does not equal 0 or
%it will be undefined in accordance with the original function.
a = 0; %lower bound, Arbitrary. f(0) > 0.
b = 1; %upper bound, Arbitrary. f(2) < 0
alpha = 0; %initial value or p0. Arbitrary.
k = abs(0.031); %k = max(|f'(x)|), a <= x <= b, Computed. f'(2) = -0.394 and is the Max.
eps = -2; %Degree of epsilon value, or 10^eps
n = ceil(abs((eps*log(10))/(log(k)))); %Number of iterations. Computed.


%First value (rows) is number of iterations or n.
%Second value (columns) is types of relevant info. (n, p, f(p), etc.)
results(n:4) = 0; %initialize array,

columns = {'n', 'p(n)'};

%BEGIN ALGORITHM
results = approx_fixedpt(alpha,n,a,b,f);
%END
%Format Results
disp(strcat('Fixed Point Iteration, for n: ', num2str(n)));
disp(columns);
disp(results);

