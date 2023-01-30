clear all
t = 5:5:60*4;
%rng(28)

%generate the square
X = [0 20 20 0 0];
Y = [0 0 20 20 0];

%generate the position of each students at the initial time  
dat = zeros(61,2);
for i = 1:61

    x0 = 20 * rand();
    y0 = 20 * rand();

    dat(i,:) = [x0 y0];

end

%visualizing the initial time positions of the students
subplot(1,2,1)
plot(X,Y,'b',LineWidth=2),hold on
plot(dat(1,1),dat(1,2),'*r')
for i = 2:61
    plot(dat(i,1),dat(i,2),'*g')
end
title('initial position')

inf0 = dat(1,:); %selecting the infected student
Ninf0 = dat(2:end,:); %considering all the others as non infected
k = 0;

while k<t(end)
    
    r1 = -.11 + 2*.11*rand();  %random walk generation from U(-0.11,0.11)
    r2 = -.11 + 2*.11*rand();
   
    
    D = zeros(size(Ninf0,1),1); %dcontainer for distnce calculations
    
    for i = 1:size(inf0,1)
        for j = 1:size(Ninf0,1)
            D(j) = norm(inf0(i,:)-Ninf0(j,:)); %distances between the infected and non infected
        end
    
        j = 1;
    
        while j<length(D)
            if D(j)<=1.5 % if that distance satisfy the condition, 
        
                u = binornd(1,.8); %generate a bernoulli distribution 
                
                if u==1 %if it's 1 the you are infected 
                    inf0 = [inf0;Ninf0(j,:)];
                    Ninf0(j,:) = [];
                    D(j,:) = [];
                end
            end
            %D = D;
            %Ninf0 = Ninf0;
            %inf0 = inf0;
            j = j+1;
        end
    
    end
    inf0 = inf0 + [r1 r2]; %Infected and 
    Ninf0 = Ninf0 + [r1 r2]; %non infected student moves
    k = k + 5; %updating the time step
end

%Visualisation after the four hours
subplot(1,2,2)
plot(X,Y,LineWidth=2),hold on

plot(inf0(1,1),inf0(1,2),'or',LineWidth=2)

for i = 1:size(inf0,1)
    plot(inf0(i,1),inf0(i,2),'*r')
end

for i = 1:size(Ninf0,1)
    plot(Ninf0(i,1),Ninf0(i,2),'*g')
end

legend('','Initially infected', 'infected','','','','','','','','','','','','','','','non infected')
title('positions after 4 hours')
axis tight

%%%% Let's see the average of infected students after 1000 simulation

Nsim = 10^3;
num_inf = [];
for ii = 1:Nsim


    dat = zeros(61,2);
    for i = 1:61
    
        x0 = 20 * rand();
        y0 = 20 * rand();
    
        dat(i,:) = [x0 y0];
    
    end
    
    
    inf0 = dat(1,:); %selecting the infected student
    Ninf0 = dat(2:end,:); %considering all the others as non infected
    k = 0;
    
    while k<t(end)
        
        r1 = -.11 + 2*.11*rand(); %random walk generation from U(-0.11,0.11)
        r2 = -.11 + 2*.11*rand();
       
        
        D = zeros(size(Ninf0,1),1); %container for distance calculations
        
        for i = 1:size(inf0,1)
            for j = 1:size(Ninf0,1)
                D(j) = norm(inf0(i,:)-Ninf0(j,:)); %distances between the infected and non infected
            end
        
            j = 1;
        
            while j<length(D)
                if D(j)<=1.5 % if that distance satisfy the condition, 
            
                    u = binornd(1,.8); %generate a bernoulli distribution 
                    
                    if u==1 %if it's 1 the you are infected 
                        inf0 = [inf0;Ninf0(j,:)];
                        Ninf0(j,:) = [];
                        D(j,:) = [];
                    end
                end
                %D = D;
                %Ninf0 = Ninf0;
                %inf0 = inf0;
                j = j+1;
            end
        
        end
        inf0 = inf0 + [r1 r2]; %Infected and 
        Ninf0 = Ninf0 + [r1 r2]; %non infected student moves
        k = k + 5; %updating the time step
    end
    
    num_inf = [num_inf;size(inf0,1)];

end

mean_inf = mean(num_inf);
