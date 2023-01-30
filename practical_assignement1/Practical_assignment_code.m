clear all

%-------------- I-Serpinski triangle ---------------------------%


%%%%% Serpinski triangle with 3 regulars corners


% defining the unit triangle
X = [0 1 .5 0];
Y = [0 0 3^.5/2 0];

figure()
plot(X,Y), hold on


%select the curent position in the unit square
x0 = rand();
y0 = rand();
s = 1/2;
%s = 2/3; % another s different from 1/2

plot(x0,y0,'.b')
for j = 1:50000 %my computer failed to run for 10^5 

    
    ind = randi(3,1); %random selection of one of the vertices

    %ind = randsample(1:3,1,true,[.4 .35 .25]); %non uniform random selection of the vertices  (uncomment
    %this line for a non  uniform selection of the verices)
    
    %moving half of distance to the selected vertice
    x0 = (x0 + X(ind))*s;
    y0 = (y0 + Y(ind))*s;
    
   
    %plot the current position
    plot(x0,y0,'.b')

end

%%%%% Serpinski triangle with 4 regulars corners

%defining the regular square
X = [0 1 1 0 0];
Y = [-1 -1 1 1 -1];

figure()
plot(X,Y), hold on


%select the curent position in the unit square
x0 = rand();
y0 = rand();

plot(x0,y0,'.b')
ind0 = randi(4,1); %random selection of one of the vertices
    
%moving half of distance to the selected vertice
x0 = (x0 + X(ind0))/2;
y0 = (y0 + Y(ind0))/2;

for j = 1:50000 %my computer failed to run for 10^5 

    
    %ind = randi(5,1); %random selection of one of the vertices non uniform
    
    ind1 = randi(4,1);

    if ind1~=ind0 %make sure the next selected vertice is different from the previous one

        x0 = (x0 + X(ind1))/2;
        y0 = (y0 + Y(ind1))/2;

    end

    %plot the current position
    plot(x0,y0,'.b')

    ind0 = ind1; %update for the next vertice

end


%%%% Serpinski triangle with 5 regulars corners

% defining the regular square
X = [1 cos(2*pi/5) cos(4*pi/5) cos(6*pi/5) cos(8*pi/5) 1];
Y = [0 sin(2*pi/5) sin(4*pi/5) sin(6*pi/5) sin(8*pi/5) 0];

figure()
plot(X,Y), hold on


%select the curent position in the unit square
x0 = rand();
y0 = rand();

plot(x0,y0,'.b')
for j = 1:50000 %my computer failed to run for 10^5 

    
    ind = randi(5,1); %random selection of one of the vertices
    
    %moving half of distance to the selected vertice
    x0 = (x0 + X(ind))/2;
    y0 = (y0 + Y(ind))/2;
    
   
    %plot the current position
    plot(x0,y0,'.b')

end


%%%% Serpinski triangle with 6 regulars corners

% defining the regular square
X = [1 .5 -.5 -1 -.5 .5 1];
Y = [0 sqrt(3)/2 sqrt(3)/2 0 -sqrt(3)/2 -sqrt(3)/2 0];

figure()
plot(X,Y), hold on


%select the curent position in the unit square
x0 = rand();
y0 = rand();

plot(x0,y0,'.b')
for j = 1:50000 %my computer failed to run for 10^5  

    
    ind = randi(6,1); %random selection of one of the vertices
    
    %moving half of distance to the selected vertice
    x0 = (x0 + X(ind))/2;
    y0 = (y0 + Y(ind))/2;
    
   
    %plot the current position
    plot(x0,y0,'.b')

end


%------------------ II - Barnsley fern type figures -----------------%

nr = 10^6;

x0 = 0; %coordinates of the initial point
y0 = 0;
Sig = [0 .01 0.05 0.1]; %Size of the gaussian/uniform noise to be added


for sig = Sig
    r = randsample(1:4,nr,true,[.01 .85 .07 .07]+abs(sig*randn(size(Sig)))); %sampling the data by adding some gaussian noise
    figure()
    scatter(x0,y0,'b'); hold on
    for i = 1:1000 %once again my computer fail to go beyond this level
    
        ind = randi(nr,1); %select a random integer 
    
        [x1 y1] = f_gaus(x0,y0,r(ind),sig); %computing the next coordinates point using the choosen function
        x0 = x1;
        y0 = y1;
        scatter(x1,y1,'blue')
    end
end



for sig = Sig
    r = randsample(1:4,nr,true,[.01 .85 .07 .07]+abs(sig*randn(size(Sig))));  %sampling the data by adding some uniform noise
    figure()
    scatter(x0,y0,'b'); hold on
    for i = 1:1000 %once again my computer fail to go beyond this level
    
        ind = randi(nr,1); %select a random integer 
    
        [x1 y1] = f_Uni(x0,y0,r(ind),sig); %computing the next coordinates point using the choosen function
        x0 = x1;
        y0 = y1;
        scatter(x1,y1,'blue')
    end
end




