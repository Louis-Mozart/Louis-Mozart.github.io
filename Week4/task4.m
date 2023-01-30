clear all;
%%%%%% discretized solution with the Euler method %%%%%%%%%%%%

X0   = 40;  %the initial state
n    = length(X0); %n of states
lam  = 1/30;     %exp decay rate
T = 1000; %final time
N = 500; %Number of simulation
time = 0:.1:T;         
%the 'euler discretizaion'
dt    = time(2)-time(1);
nstep = length(time);
i = 2:n-1;
prob  = lam*dt;   %the exponential probability


time_death = [];
for ii = 1:N %loop through the number of simulations.
    XX(1:n,1) = X0(:); X = X0(:);
    for k=2:nstep
        remov(1) = sum(rand(X(1),1)<prob); %how many removed 
         X(1)   = X(1)-remov(1);
        XX(:,k) = X;
    end
    d = find(XX==min(XX),1); %looking for when the whole population dissapear
    time_death = [time_death;d];
end  

time_N90 = quantile(.1*time_death,.9); %compute the 0.9 quantile

%visualization
plot(time,XX,'r',LineWidth=2);hold on;

 [t,y] = ode45(@ABCode,time,X0,[],lam);
 plot(t,y,'b--','LineWidth',2)
 legend('Probabilistic solution','analytic solution')


 %% ODE system function
% solve analitically dx/dt = -lam*t
 function dy=ABCode(t,y,lam)
    A = y(1);
    

    dy(1) = -lam*A;
    

    dy = dy(:);  % make sure that we return a column vector
end

