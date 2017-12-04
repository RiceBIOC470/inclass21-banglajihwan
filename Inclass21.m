%In class 21

%GB comments
1 100
2 100
overall 100


% 1. Consider the system we discussed in class for a gene which is produced
% and degraded: dx/dt = k - d*x. Now consider that this gene turns on a
% second gene y, which also degrades so that its equation is 
% dy/dt = k2*x - d2*y. Choose some values for k,d,k2, and d2 and run a
% numerical simulation of this system for the case where both genes start
% out off ( x(0) = 0 and y(0) = 0). Plot the value of x and y in time and 
% explain your results. 

% k1 =1, d1 =1, k2 = 2 , d2 =2 
xODE = @(t,x) [1-x(1);2*x(1) - 2*x(2)]; 
%yODE = @(t,y) 2*y(1)-2*y(2); 

solx = ode23(xODE, [0 10],[0,0]);
plot(solx.x, solx.y(1,:), 'r.-'); hold on;
plot(solx.x, solx.y(2,:), 'g.-'); 
legend({'x','y'}) hold off 
% comments:  both curves levels off because of the first of degradation. 
% green curve(y) show exponetial increase depends production depends on
% itself; for red curve this is not the case, increase at first is more
% linear. 


% 2. Consider the following model: 
% dx/dt = y
% dy/dt = (1-x^2)*y - x
% write code that simulates this system for several different starting
% values of x and y. Plot the results and comment on them. 

ODE = @(t,x) [x(2);(1-x(1)^2)*x(2) - x(1)];
for i = 1:10
x0 = 10*rand(1)
y0 = 10*rand(1)
solx = ode23(xODE, [0 25],[x0,y0]);
figure (i)
plot(solx.x, solx.y(1,:), 'r.-'); hold on;
plot(solx.x, solx.y(2,:), 'g.-'); 
legend({'x','y'}) 

hold off 
end 
% both curves reach steady state of 1
% x will just decrease to 1 independent of initial state
% y may increase and then decrease when the initial state is small. 


