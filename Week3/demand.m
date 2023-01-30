function [profit,Mtime,demand] = demand(M,price,prob_day,prob_demand,Nsim)
    % The function computes the profit for a period
    % with given demand probabilities, averaged over
    % sampled days.
    %INPUT  M               size of storage
    %       price           
    %       prob_day        distribution of day types
    %       prob_demand     distribution of demand for day
    %                           types; last col.: amounts
    %                           of demand
    %       Nsim            # of simulations sampled
    %OUTPUT profit          averaged profit with given
    %                           objective dfunction
    %       Mtime           storage during the period
    %       demand          demands over days & simulations

    price_buy   = price(1);
    price_sell  = price(2);
    price_left  = price(3);

    N_daytype   = size(prob_day,1);     % number of day types
    N_period    = size(prob_day,2);     % number of days in a period
    N_demtype   = size(prob_demand,1);  % number of demand types
    idemand     = size(prob_demand,2);  % column of the demand values

    cdf_day = cumsum(prob_day);         % cdf of the day type probs
    cdf_dem = cumsum(prob_demand);      % cdf of the demand probs

    for sim = 1:Nsim
        for day = 1:N_period
            % day type (random)
            day_type = invcdf(1:N_daytype, cdf_day(:,day), 1, 2);
            % demand of the day (random
            demand(day,sim) = invcdf(prob_demand(:,idemand), cdf_dem(:,day_type), 1, 2);
        end
    end

    if (N_period == 1)
        cumdemand = demand;
    else
        cumdemand = cumsum(demand);
    end

    % storage during the period, first day = M
    % other days: storage after the demand of previous day
    Mtime(1,1:Nsim) = M;
    Mtime(2:N_period,:) = max(M - cumdemand(1:N_period-1,:), 0);

    % situation at the end: initial storage minus overall demand
    end_situ = M - cumdemand(N_period,:);

    buy = M * price_buy;    
    sell = min(demand,Mtime) * price_sell;
    left_over = max(end_situ, 0) * price_left;
    excess_dem = max(-end_situ, 0) * (price_sell - price_buy);

    profit = [sell
              -excess_dem
              left_over];
    % The profit in each simulated period:
    profit = sum(profit) - buy;
    % average over Nsim simulations
    profit = sum(profit) / Nsim;
end