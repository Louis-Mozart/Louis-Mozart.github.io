clear all; 

N    = 1000;
X0   = [N zeros(1,7)];  % the initial state [1000 0 0 ... 0]
n    = length(X0); % n of states
sig  = 8;       % sigma for normal distribution
time = linspace(0,500,1000);        
dt    = time(2)-time(1);
nstep = length(time); 

Y = []; s0=X0;


for K=1:10 %repeat the ABM calculations
    % initial values:
    S(:,1) = ones(N,1); % initially all in A
    S(:,2) = 100 + sig*randn(N,1);    % init waiting times from exp distribution  
                                   % test other distributions !
    NN(1,:) = X0;
    for k=2:nstep
        S(:,2) = S(:,2)-dt;       % remove dt from waiting times
        move   = find(S(:,2)<=0); % check who is going to get to next compartment
        S(move,1) = S(move,1)+1;  % move to next compartment
        S(move,2) = 100+sig*randn(length(move),1); % new time
        iC = find(S(:,1)==8); S(iC,7) = Inf; % never leave X8
        for kk=1:8; NN(k,kk) = sum(S(:,1)==kk); end  % size of population in X1,X2,...,X8
     end

    hold on; plot(time,NN,'b-'); 
end 

fprintf('The maximum value of sigma that each compartment to reach the maximum value of 1000 is %i\n',sig)
