clear all
%simulation of a service line, plus the queue in front of it
%with random interarrival and service times 





nsim = 10^3;
avg_output = [];
ii = 0;
for K = 1:nsim 
    timestep = 1;
    finaltime= 500;
    job_time = [4 3 2];           %initialize job/service times
    inter_arrival = round(35 + 20*randn());            %initialize the interarrival time with a random distribution of mean 35 and std = 20
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    job_time = [inter_arrival 0 job_time 0];   %input+service+states+output

    %random times here from uniform  distributions with limits:
    lower = [20 10 10 1 1 0];  %lower bounds for inter_arrival and (3) service times, 
                            %fixed queue, output
    upper = [50 30 40 3 4 0];  %upper  "
    
    % lower = [1 0 4 3 2 0]; 
    % upper = [1 0 4 3 2 0];
    
    ns  = length(job_time);
    s   = zeros(1,ns);  %0 idle, 1 occupied
    age = s;           %how long job done
    
    s_in = 1;      
    s(1) = s_in;    %INPUT   always coming /occupied
    s_out = 0;
    s(ns) = s_out;  %OUTPUT  always available, idle
    Output= [];     %cumulative output
    
    S = []; A=[];
    S(1,:) = s;       %save states
    A(1,:) = age;     %save times done for jobs
    i      = 1:ns-1;
    for t=1:timestep:finaltime;
       
     occupied       = s(i)>0;                   %states occupied
     age(occupied)  = age(occupied) + timestep; %increase age of ongoing jobs
     job_done       = age(i) >= job_time(i);
     next_vacant    = s(i+1)==0; 
     next_vacant(1) = 1;    %'vacant': always welcome to queue!
     move = find(occupied & job_done & next_vacant);
                      
     if length(move)>0  %do the move in the queue
       s(move+1)   = s(move+1)+1;  %to this place
       s(move)     = s(move) - 1;  %...from here
       age(move+1) = 0;     %initialize the age counter to zero
       age(move)   = 0;     %   "
       job_time(move+1) = irand(lower(move+1),upper(move+1),1); %new jobs get new service times
       if ismember(1,move)  %check for new arrival
          job_time(1) =  irand(lower(1),upper(1),1);          %new inter_arrival time
       end
     end
    
     s(1)  = s_in;   %keep occupied 
    
     Output= [Output; s(ns)]; 
     s(ns) = s_out;  %keep exit free!
     
     S = [S;s];
     A = [A;age];
     
    end
    
    %analyze the output;
    avg_output = [avg_output;sum(Output)]; %how many came out
    ii = ii+1 %see how the loop goes
end

avg_output = mean(avg_output)
