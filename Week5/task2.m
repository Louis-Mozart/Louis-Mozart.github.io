clear all; close all;

X0   = [2000 1000  0 ];  %the initial state
n    = length(X0); %n of states
lam  = [.03 .02 .01];     %exp decay rate
time = linspace(0,300,100);        
%the 'euler discretizaion'
dt    = time(2)-time(1);
nstep = length(time); i = 2:n-1;
prob  = lam*dt;   %the exponential A--> B --> C probability

XX(1:n,1) = X0(:); X = X0(:);
for k=2:nstep
    remov(1) = sum(rand(X(1),1)<prob(1)); %how many removed 
      X(1)   = X(1)-remov(1);
    for i = 2:n
       remov(i) = sum(rand(X(i),1)<prob(i));
       X(i)   = X(i) + remov(i-1) - remov(i);
    end
    
    XX(:,k) = X;
end  
[t,y] = ode45(@ABCode,time,X0,[],lam);

 plot(time,XX,'-r');hold on;
 plot(t,y,'b-')
 legend('probabilistic solution','','','deterministic solution')
 
 %% ODE system function
 function dy=ABCode(t,y,lam)
    A = y(1);
    B = y(2);
    C = y(3); 

    dy(1) = lam(end)*y(end)-lam(1)*y(1);
    
    for i = 2:3
        dy(i) = lam(i-1)*y(i-1)-lam(i)*y(i);
    end

    dy = dy(:);  % make sure that we return a column vector
end



