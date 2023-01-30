clear all

%samples for uniform distribution 
a_i = -3 + 10*rand(10,1);
a_ii = -3 + 10*rand(10^4,1);

%samples for normal distribution
b_i = -1 + 2*randn(10,1);
b_ii = -1 + 2*randn(10^4,1);

%histograms
[N1_i,X1_i] = hist(a_i);
[N1_ii,X1_ii] = hist(a_ii);
[N2_i,X2_i] = hist(b_i);
[N2_ii,X2_ii] = hist(b_ii);

%normalized histogram
flag = 1;
normed_hist1_i =  n_hist(N1_i,X1_i,flag);
normed_hist1_ii =  n_hist(N1_ii,X1_ii,flag);
normed_hist2_i =  n_hist(N2_i,X2_i,flag);
normed_hist2_ii =  n_hist(N2_ii,X2_ii,flag);

%Distribution fits:

% pd1 = makedist('Uniform','lower',-3,'upper',7); % Uniform distribution with a = -3 and b = 7
% pd2 = makedist('Normal','mu',-1,'sigma',2);

x = linspace(0,1,100);
pd1 = normpdf(x,-1,2);
pd2 = pdf('unif',x,-3,7);

% x = 0:.03:.8;
% pdf1 = pdf(pd1,x);
% pdf2 = pdf(pd2,x);



%Plots
subplot(2,2,1)
histogram(normed_hist1_i), hold on
ksdensity(a_i), hold off
subplot(2,2,2)
histogram(normed_hist1_ii), hold on
ksdensity(a_ii), hold off
subplot(2,2,3)
histogram(normed_hist2_i), hold on
ksdensity(b_i), hold off
subplot(2,2,4)
histogram(normed_hist2_ii), hold on
ksdensity(b_ii), hold off


%%We observe from the plots that we have better results as the sample size
%%is large.



