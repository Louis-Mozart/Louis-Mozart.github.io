function [X,Y] = f_Uni(x,y,i,sig)
%%%% given and index i = 1,...,4, the function will return f_i

A = zeros(2,8);
A1 = [0 0;0 .16];
A2 = [.85 .04;-.04 .85];
A3 = [.2 -.26;.23 .22];
A4 = [-.15 .28;.26 .24];

f = zeros(2,4);

f1 = [0;0];
f2 = [0;1.6];
f3 = f2;
f4 = [0;.44];

f(:,1) = f1+sig*rand(size(f1));
f(:,2) = f2+sig*rand(size(f1));
f(:,3) = f3+sig*rand(size(f1));
f(:,4) = f4+sig*rand(size(f1));

A(:,1:2) = A1;%+sig*randn(size(A1));
A(:,3:4) = A2;%+sig*randn(size(A2));
A(:,5:6) = A3;%+sig*randn(size(A3));
A(:,7:8) = A4;%+sig*randn(size(A4));

x = A(:,2*i-1:2*i)*[x;y]+f(:,i);

X = x(1,:);
Y = x(2,:);

end