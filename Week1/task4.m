clear all

nsim = 10^3; %number of simulation

% first and second sample sizes
n_a = 10;  
n_b = 10^3;

mean_a = [];
var_a = [];
for i = 1:nsim
    x = -1 + 2*rand(n_a,1); 
    S = 3/4*(1-x.^2);
    [S_cdf,X] = empcdf(S,n_a);
    xx2 =  invcdf(X,S_cdf,n_a,1);
    mean_a = [mean_a; mean(xx2)];
    var_a = [var_a;var(xx2)];
end

mean_sim_a = mean(mean_a);
var_sim_a = mean(var_a);

mean_b = [];
var_b = [];
for i = 1:nsim
    x = -1 + 2*rand(n_b,1); 
    S = 3/4*(1-x.^2);
    [S_cdf,X] = empcdf(S,n_b);
    xx2 =  invcdf(X,S_cdf,n_b,1);
    mean_b = [mean_b; mean(xx2)];
    var_b = [var_b;var(xx2)];
end

mean_sim_b = mean(mean_b);
var_sim_b = mean(var_b);

%relevant plots

x = linspace(0,1,100);
pd1 = normpdf(x,mean_sim_b,var_sim_b/n_b);
pd2 = normpdf(x,mean_sim_a,var_sim_a/n_a);

subplot(1,2,1)
histogram(mean_b), hold on
plot(x,pd1,LineWidth=2), hold off
title('sample size = 1000')

subplot(1,2,2)
histogram(mean_a), hold on
plot(x,pd2,LineWidth=2), hold off
title('sample size = 10')

%%% We observe from the plots that as the number of size increase, there is
%%% just a slight change ie increase the size does not affect too much the
%%% convergence.
