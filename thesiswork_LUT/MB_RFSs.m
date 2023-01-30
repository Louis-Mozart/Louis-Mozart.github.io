clear all
X = [];
N = 2;
R = [0.8 0.8];
mu1 = [2;2];
mu2 = [-2;-2];
sigma1 = 0.3*eye(2);
sigma2 = 0.3*eye(2);
mu = [mu1 mu2];
sigma = [sigma1;sigma2];
k = 0;
while k < 5
    for i = 1:N
        if rand < R(i)
            x = mvg(mu(:,i),sigma1,1);
            X = [X x];
        end
    end
    k = k+1;
end
[a b] = size(X);
h1 = plot_gaussian_ellipsoid(mu1, sigma1);
h2 = plot_gaussian_ellipsoid(mu2, sigma2);
set(h2,'color','g'); hold on
set(h1,'color','g'); 
for i = 1:a 
    for j = 1:b
         plot(X( ...
             i:j),'*r')
         pause
    end
end

 
