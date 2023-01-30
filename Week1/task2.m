clear all

n = 10^5; %sample size
lambda = 2; 

%first method

X = rand(n,1); %Uniformly distributed sample
xx1 = -lambda*log(1-X); %Formula in the slide F^-1(y) = -lambda *ln(1-y)

%second method

S = exprnd(lambda,n,1); 
[S_cdf,x] = empcdf(S,n);
xx2 =  invcdf(x,S_cdf,n,1);

%third method

xx3 = expinv(X,lambda);

%% compute the mean of each sample

mean_xx_1 = mean(xx1);
mean_xx_2 = mean(xx2);
mean_xx_3 = mean(xx3);

%histogram plots:

subplot(1,3,1)
histogram(xx1);
subplot(1,3,2)
histogram(xx2);
subplot(1,3,3)
histogram(xx3);

