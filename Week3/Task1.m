clear all

load dice_p.mat

nsim = 10^5;

% [cdf_emp,~] = empcdf(p,16);
% r = invcdf(p,cdf_emp,2,2);


Prob = [];
mean_sim = [];
for i = 1:nsim

    T1 = round(1 + 15*rand());  %taking the first throw from a uniform distribution on (1 16) and round the result to the nearest integer
    T2 = round(1 + 15*rand());  %doing the same with the second throw

    P =floor(T1*T2/10);    % aplying the game principle
    Prob = [P;Prob];  % store the result
    
    mean_sim = [mean_sim;mean(Prob)];
end

mean_sim = mean(mean_sim); % computing the average outcomme of the simulation

% visualization
subplot(1,2,1)
histogram(Prob)
title('histogram')
subplot(1,2,2)
ksdensity(Prob)
title('Estimated desnsity')

% most likely outcome of the game:

%From the histogram we can clearly see that the most outcome of the game is
% 1 and we can verify this with the function mode as:

Most_out = mode(Prob);

%% and it probablity can be estimated using the ksdensity function as:

prob = max(ksdensity(Prob));

fprintf("the most likely outcome of the game is %i with estimated proba %d\n",Most_out,prob);
fprintf("the mean outcome of the simulation is %d\n", mean_sim);
