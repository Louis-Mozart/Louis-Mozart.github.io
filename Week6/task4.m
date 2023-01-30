clear all

nr = 10^6;
cont = 2; %discrete data
X = [1 4 3 2]; % data representing the indeces of each function

cdf_emp = [.01 .086 .093 1]; % Empirical cdf computed mannually

r = invcdf(X,cdf_emp,nr,cont); %sampling the data

x0 = 0; %coordinates of the initial point
y0 = 0;
figure()
scatter(x0,y0,'.red'); hold on
for i = 1:10000 %once again my computer fail to go beyond this level

    ind = randi(nr,1); %select a random integer 

    [x1 y1] = f(x0,y0,r(ind)); %computing the next coordinates point using the choosen function
    x0 = x1;
    y0 = y1;
    scatter(x1,y1,'.blue')
end