clear all

S0 = 0;
params = [1 7 4];
t1 = 0:10^-4:1;
t2 = 0:10^-6:1;


Nens = 10^4;

[ S10 , ~ ] = OrnsteinUhlenbeck( S0 , params , t1 , Nens );

[S104 , ~ ] = OrnsteinUhlenbeck( S0 , params , t2 , Nens );


hyp_test = kstest2(S10,S104);

%distribution for comparison

subplot(1,2,1)
ksdensity(S10)

subplot(1,2,2)
ksdensity(S104)
%we can already see with our eyes that they almost have the same
%distribution and the kstest gives the confirmation
