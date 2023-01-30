clear all

load samples.txt

% plot the histograms
subplot(2,2,1)
histogram(samples,5)
title("nbins = 5")

subplot(2,2,2)
histogram(samples,10)
title("nbins = 10")

subplot(2,2,3)
histogram(samples,15)
title("nbins = 15")

subplot(2,2,4)
histogram(samples,20)
title("nbins = 20")

%%% The plots shows that nbins = 20 fit well the true data

X = linspace(0,8,100);
F = @(x) empcdf(samples,100,x);
CDF = 1-F(X);

% Evaluate the integral using the trapezoidal rule 


h = X(2)-X(1);
N = 100;
E = 0;


for i = 2:N
    E = E + (CDF(i)+CDF(i-1))/2*h;
end

fprintf("the estimated mean of the sample is %d\n", E)
