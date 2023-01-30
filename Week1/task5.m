clear all

n = 10^4; %total number of points

% generating abcisses and coordinates points from U(-1,1)
Ux = -1 + 2*rand(n,1); 
Uy = -1 + 2*rand(n,1);

%plot the square and the unit cercle

P = [-1 1 1 -1 -1];
Q = [-1 -1 1 1 -1];

angles = linspace(0,2*pi,100);
radius = 1;
CenterX = 0;
CenterY = 0;
x = radius * cos(angles) + CenterX;
y = radius * sin(angles) + CenterY;
plot(x, y, 'b-', 'LineWidth', 2); hold on
plot(P,Q)

int_c = 0; %this will to count the points inside the square

for i = 1:n
    if Ux(i)^2+Uy(i)^2>1 %those are the points outside of the sqaure

       plot(Ux(i),Uy(i),'.g')
       

    else
        plot(Ux(i),Uy(i),'.r') %those who are inside
        int_c = int_c + 1;
    end
end

pi_approx = 4 * int_c/n; %approximation of pi

disp(pi_approx); %displaying the approximated value
