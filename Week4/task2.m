clear all


S0 = 2;
params = [1 11 2^.5];
t = 0:.01:10;
Nens = 100;

[ S10 , ~ ] = OrnsteinUhlenbeck( S0 , params , t , Nens );

plot(S10)

Nens = 10^4;
[S104 , ~ ] = OrnsteinUhlenbeck( S0 , params , t , Nens );

mean_OU = mean(S104(end));
var_ou = var(S104(end));


