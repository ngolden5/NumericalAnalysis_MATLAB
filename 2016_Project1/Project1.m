varlist = {'table','results','ans'};
clear(varlist{:});
h=[0.5, 0.25, 0.125, 0.0625]; %time step
a = 1; %lower bound
b = 2; %upper bound
alpha = 2; %initial value
results(17:4) = 0; %initialize array
expected(17:1) = 0;
f = inline('3*y+0*t','t','y'); %y' = f(t,w)
columns = {'t', 'w', 'error'};

% output(1:length(t),1) = t;
% output(1:length(w),2) = w;

for i=1:4
expected = P1_TrueSolution(alpha,h(i),a,b);
disp(strcat('True Solution, for h: ', num2str(h(i))));
disp({'t', 'w'});
disp(expected);

results = approx_euler(alpha,h(i),a,b,f);
results(:,3) = abs(results(:,2) - expected(:,2));
disp(strcat('Eulers Method, for h: ', num2str(h(i))));
disp(columns);
disp(results);

results = approx_modeuler(alpha,h(i),a,b,f);
results(:,3) = abs(results(:,2) - expected(:,2));
disp(strcat('Modified Eulers Method, for h: ', num2str(h(i))));
disp(columns);
disp(results);

results = approx_rungekutta(alpha,h(i),a,b,f);
results(:,3) = abs(results(:,2) - expected(:,2));
disp(strcat('Runge-Kutta Method, for h: ', num2str(h(i))));
disp(columns);
disp(results);

results = approx_adamspredcorrect(alpha,h(i),a,b,f);
results(:,3) = abs(results(:,2) - expected(:,2));
disp(strcat('Adams Predictor/Corrector Method, for h: ', num2str(h(i))));
disp(columns);
disp(results);
end