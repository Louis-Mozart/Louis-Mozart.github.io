
clear all; close;
X0   = [100 50 0];  %the initial state A,B,C
n    = length(X0); %n of states
lam  = [0.01 0.02];     %exp decay rates
final_time = 400;       

XX(1:n,1) = X0(:); X = X0(:);t=0;k=0;
tic
while t<final_time 
    k=k+1;
    react = [lam(1)*X(1)  lam(2)*X(2)];      %reaction rates
    delta = exprnd(1/sum(react));      %time to next event/reaction
    cdf   = cumsum(react)/sum(react);  %CDF of (2) reactions
    ireac = invcdf(1:2,cdf,1,2);       %sample which event/reaction
    X(ireac)  = X(ireac)-1;        %update state values
    X(ireac+1)= X(ireac+1)+1;      %   "
    t = t+delta;                   %update time
    XX(:,k) = X;                   %save the state  
    time(k) = t;                   %save the time
end  
toc
 plot(time,XX,'r');hold on;
 
 %tic
 %[t,y] = ode45(@ABC_ode,linspace(0,final_time,100),X0,[],lam);
 %toc
 %plot(t,y,'b-','LineWidth',2);hold off




