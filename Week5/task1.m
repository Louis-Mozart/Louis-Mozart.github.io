clear all



params = [2 .75];
S0 = 1;
Nens = 10^2;
t = linspace(0,10,Nens);

[ S ] = GBM( S0 , params , t , Nens );

S_tilde = S0*exp((params(1)-params(2)^2/2)*t + params(2)*t.^.5*randn());

S_tilde = datasample(S_tilde,Nens);

subplot(1,2,1)
plot(t,S)
%axis([0 10 0 10^7])
title('numerical solution of the SDE')


subplot(1,2,2)
plot(t,S_tilde)
%axis([0 10 0 10^7])
title('Exact solution of the SDE')

Nens = 10^5;
t = linspace(0,1,Nens);

[ S ] = GBM( S0 , params , t , Nens );

S_tilde = S0*exp((params(1)-params(2)^2/2)*t + params(2)*t.^.5*randn());

S_tilde = datasample(S_tilde,Nens);

hyp_test = kstest2(S(end),S_tilde(end));

