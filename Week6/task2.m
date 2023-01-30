clear all

%dices generating
A = [3*ones(5,1);6];
B = [2*ones(3,1);5*ones(3,1)];
C = [ones(5,1);4];

ns = 10^6;
nx = 6;
cont = 2;

% Estimating the cdf
[cdf_empA,~] = empcdf(A,nx);
[cdf_empB,~] = empcdf(B,nx);
[cdf_empC,~] = empcdf(C,nx);

%sampling
rA = invcdf(A,cdf_empA,ns,cont);
rB = invcdf(B,cdf_empB,ns,cont);
rC = invcdf(C,cdf_empC,ns,cont);

%estimation of the probabilities


AvsB = length(rA(rA<=rB))/ns; % P(A<=B)
BvsC = length(rB(rB<=rC))/ns; % P(B<=C)
CvsA = length(rC(rC<=rA))/ns; % P(C<=A)


