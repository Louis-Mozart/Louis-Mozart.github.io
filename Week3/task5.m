
clear all

load random_walk.mat

%estimation of lambda

% Since we alredy know that x(k+1) - x(k) follows a uniform distribution, to
% estimate the value of lambda, I just store all those values x(k+1) - x(k)
% in a variable %called r and then I estimate its density using ksdensity and the
% estimated value can be read directly on the curve it is the intersection
% point between the estimated density and the positive x-axis

r = [];

for k = 1:499

    r = [r;x(k+1)-x(k)];
    

end

%plot for the random walk:


subplot(1,2,1)
plot(x)
title('Random walk')
subplot(1,2,2)
ksdensity(r)
title('Estimated density of r')

%we can read in the plot that

lam = 2.53;
