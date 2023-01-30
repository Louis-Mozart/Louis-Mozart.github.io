clear all; close all;

%% Deterministic and probabilistic  discretization for SEIR models
Total = 1000; finaltime = 40; nsimustep = 2000; init_infected = 100;
nrep  = 20;  
alfa  = 2; beta = 0.4;
b     = [alfa, ones(1,3)*beta, Total];

time  = linspace(0,finaltime,nsimustep);
s0    = [35  15 0];

%the deterministic model solution:
[t,y]= ode45(@seir_ode,time,s0,[],b); 

%nrep repetitions of the probabilistic solution
for kk=1:nrep
 Y{kk} = seir_euler(time,s0,b);
end

%calculate the mean of the nrep repetitions:
 Ymean(1:4,1:nsimustep) = Y{1};  
 for kk=2:nrep
     plot(time,Y{kk},'g-','LineWidth',1.5);hold on;
     Ymean = 1/kk*(Ymean*(kk-1) + Y{kk}); 
 end
 %compare to the deerministic, and to the mean:
 plot(time,y,'r-',time,Ymean,'b-','LineWidth',1.5);hold off;

 %% 
 function XX = seir_euler(time,X,b)
    %X(1:4): S E I R
    X = X(:); b=b(:); XX = X;
    n = length(X); da=zeros(n-2,1);
    N = b(end);          

    %the 'euler discretizaion'
    dt    = time(2)-time(1);
    nstep = length(time); i = 2:n-1;
    prob(1) = b(1)*dt*X(3)/N;   %the infection reaction term
    prob(i) = b(i)*dt;          %the exponential E--> I --> R terms

    for k=2:nstep
        rem(1) = sum(rand(X(1),1)<prob(1));
        X(1)   = X(1)-rem(1);
        for i = 2:n-1   %E & I  (or just I if n=3)
           rem(i) = sum(rand(X(i),1)<prob(i));
           X(i)   = X(i) + rem(i-1) - rem(i);
        end
        %keyboard
        prob(1) = b(1)*dt*X(3)/N;    %update infection term
        X(n)    = X(n) + rem(n-1);   % R
        XX(:,k) = X;
    end  
   
 end
 
 %%
 function dX = seir_ode(t,X,b)
    X = X(:); b=b(:);
    n = length(X); da=zeros(n-2,1);
    N = b(end);          
    c = X/N;
    i = 2:n-1;
    I = min(n-1,3); %2 for SIR,3 for SEIRs

    rea(1) = b(1)*c(1)*c(I);
    rea(i) = b(i).*c(i);

    da1   =           -rea(1);
    da(i) = rea(i-1) - rea(i);
    dan   = rea(n-1);

    dX = N*[da1;da(i);dan];
 end

