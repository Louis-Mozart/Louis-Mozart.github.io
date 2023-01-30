clear all

% defining the unit triangle
X = [0 1 .5 0];
Y = [0 0 3^.5/2 0];
plot(X,Y), hold on


%select the curent position in the unit square
x0 = rand();
y0 = rand();

plot(x0,y0,'.b')
for j = 1:10000 %my computer failed to run for 10^5 

    
    ind = randi(3,1); %random selection of one of the vertices
    
    %moving half of distance to the selected vertice
    x0 = (x0 + X(ind))/2;
    y0 = (y0 + Y(ind))/2;
    
   
    %plot the current position
    plot(x0,y0,'.b')

end

