clear all

% storage size problem: a period of days

prob_day = [0.35        % good
            0.45        % fair
            0.20];      % poor

prob_mon = [0 0 1]';     % poor
prob_wend = [1 0 0]';    % good
prob_week = [prob_mon prob_day prob_day prob_day ...
    prob_wend prob_wend prob_day];

               %g    %f      %p    %demand
prob_demand = [0.03 0.10    0.44    40
               0.05 0.18    0.22    50
               0.15 0.40    0.16    60
               0.20 0.20    0.12    70
               0.35 0.08    0.06    80
               0.15 0.04    0.00    90
               0.07 0.00    0.00    100];

price_buy = 0.33;
price_sell = 0.5;
price_left = 0.05;
price = [price_buy price_sell price_left];

Nsim = 2000;
M = 360:10:560;      % try different storage sizes
profits = [];        % initialization
profits_quantiles = []; %variable to store all the three quantiles

for buy = M
    % collect the results in the vector 'profit'
    [profitm,~,~,pq] =  demand_quant(buy,price,prob_week,prob_demand,Nsim);
    profits = [profits;profitm];
    profits_quantiles = [profits_quantiles;pq];
end

profits_median = profits_quantiles(:,1);
profits_05 = profits_quantiles(:,2);
profits_95 = profits_quantiles(:,3);

%visualization

subplot(2,2,1)
plot(M,profits)
title('mean')

subplot(2,2,2)
plot(M,profits_median)
title('median')

subplot(2,2,3)
plot(M,profits_05)
title('0.05 quantile')

subplot(2,2,4)
plot(M,profits_95)
title('0.95 quantile')

%plot(M,profits);