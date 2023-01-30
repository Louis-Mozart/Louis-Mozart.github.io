clear; close all;

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

Nsim = 1000;
M = 360:10:560;      % try different storage sizes
profit = [];        % initialization

for buy = M
    % collect the results in the vector 'profit'
    profit = [profit; demand(buy,price,prob_week,prob_demand,Nsim)];
end

plot(M,profit);