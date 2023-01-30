clear all; close all;

X0   = [3000 0  0 ];  %the initial state
n    = length(X0); %n of states
lam  = 0.01;     %exp decay rate
time = linspace(0,500,10000);        
%the 'euler discretizaion'
dt    = time(2)-time(1);
nstep = length(time); i = 2:n-1;
prob  = lam*dt;   %the exponential A--> B --> C probability

XX(1:n,1) = X0(:); X = X0(:);
for k=2:nstep
    remov(1) = sum(rand(X(1),1)<prob); %how many removed 
      X(1)   = X(1)-remov(1);
    for i = 2:n-1
       remov(i) = sum(rand(X(i),1)<prob);
       X(i)   = X(i) + remov(i-1) - remov(i);
    end
    X(n)    = X(n) + remov(n-1);   % C
    XX(:,k) = X;
end  

 plot(time,XX,'r');hold on;

 [t,y] = ode45(@ABCode,time,X0,[],lam);
 plot(t,y,'b-','LineWidth',2)
 
 %% ODE system function
 function dy=ABCode(t,y,lam)
    A = y(1);
    B = y(2);
    C = y(3); 

    dy(1) = -lam*A;
    dy(2) =  lam*A - lam*B;
    dy(3) =          lam*B;

    dy = dy(:);  % make sure that we return a column vector
end







