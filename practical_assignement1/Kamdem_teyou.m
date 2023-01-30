
clear all
close all
clc

%---------------------------- Exercise 1 ---------------------------------%

%%% Defining the points tj

T = linspace(0,1,150);
T = T';  

% Construct the matrix A

A = zeros(150,151);

A(1,1) = 1;
A(1,2) = 1;
for i=2:150
   
    A(i,1) = 1;
    
    for k = 2:i

        A(i,k) = 2;

    end

    A(i,i+1) = 1;

end

A = 1/300 * A;

%%%% SVD decomposition %%%%%

[U S V] = svd(A);

d = diag(S); % Extracting the singular values

%%%% plot the singular values of A

figure()
semilogy(d)

%%% Moore–Penrose pseudoinverse of A

A_pse = inv(A'*A)*A';

%% mearsurement matrix:

g = cos(pi*T).*sin(4*pi*T).^2+5*T.^2;


%% Aproximated solution (minimum norm solution without noise)

x_approx = A_pse*g;

%% Approximated solution with noise

n = 0.05*randn(length(g),1);
g_noise = g + n;
x_approxn = A_pse*g_noise;

%% Exact derivative

g_exac = -pi*sin(pi*T).*sin(4*pi*T).^2+8*pi*cos(4*pi*T).*sin(4*pi*T).*cos(pi*T)+10*T;

T1 = linspace(0,1,151);
T1= T1';

%%%% ploting the exact derivative vs the approximated derivatives

figure()
plot(T,g_exac,T1,x_approx)
legend('Exact derivative','approx. derivative without noise')

figure()
plot(T,g_exac,T1,x_approxn)
legend('Exact derivative','approx. derivative with noise')

%%%%%%% Truncated SVD 

dd = [0.006 0.03 0.11]; %Values that the eigen values should be greater to (treshold).

for j = dd

    S3 = S(S>j); %Selecting the threshold of the eigenvalues in the singular matrix
    
    %%% coresponding pseudo inverse: We just need to invert the elemnt at
    %%% the diagonal and take the transpose of the whole matrix.
    
    S3 = [1./S3; zeros((150)-length(S3),1)];

    Is3 = [diag(S3),zeros(150,1)]; 
    Is3 = Is3';
    
    %%% corresponding pseudo inverse of A:

    A_pse3 = V*Is3*U';
    
    %%% corresponding approximation with the noisy data
    
    g_approxn3 = A_pse3*g_noise;
    
    figure()
    plot(T,g_exac,T1,g_approxn3)
    legend('Exact derivative','approx. derivative with noise usind TSVD')

end

%--------------------------- Exercise 2 ----------------------------------

load ex2.mat

X = linspace(0,pi,99);
h = pi/100;

%%%% Implenetation of the big matrix B

b = -(2+h^2);

B = zeros(99,99); 

for i = 2:98
    B(i,i-1) = 1;
    B(i,i) = b;
    B(i,i+1) = 1;
     
end

%boundary conditions

B(1,1) = b;
B(1,2) = 1;
B(99,98) = 1;
B(99,99) = b;
B = 1/h^2*B;

%%% Tichonov regularization:

err = 0.01*99^.5;   % error for the Morozov dispregnancy rule
T = 0.1;
A = expm(T*B);   % Solution of the ODE
f1 = 1/10*X.*(3*X-pi).*(4*X-3*pi).*(X-pi)+2*sin(10*X);
f2 = 1/10*X.*(3*X-pi).*(4*X-3*pi).*(X-pi);

%%%%% This block of commented code is for finding the suitable alpha
%%%%% (satisfying the dispregnancy rule)

% a2 = [0.1 0.01 0.001 0.0001]; %finding the best alpha for y2
% E = [];
% for alpha = a2
%     
%     func2 = @(F) norm(A*F-y2)^2 + alpha*norm(F)^2; %% function to optimize for y2
%     
%     F0 = ones(99,1); % starting point of the optimization problem
%     F2 = fmincon(func2,F0);
%     E = [E norm(F2-y2)];
% 
% end
% 
% a1 = [.1 .01 .001]; %finding the best alpha for y1
% E = [];
% 
% for alpha = a1
%     func1 = @(F) norm(A*F-y1)^2 + alpha*norm(F)^2; %% function to optimize for y1
%     F0 = ones(99,1); % starting point of the optimization problem
%     F1 = fmincon(func1,F0); 
%     E = [E norm(F1-y1)];
% end

alpha = 0.01;                % Best possible alpha

func1 = @(F) norm(A*F-y1)^2 + alpha*norm(F)^2;  % function to optimize for y1
func2 = @(F) norm(A*F-y2)^2 + alpha*norm(F)^2;  % function to optimize for y2
F0 = ones(99,1);     %starting point of the optimization problem  
F1 = fmincon(func1,F0);  %looking for the minimum of y1 (Tichonov regularizer with data y1)
F2 = fmincon(func2,F0);  %looking for the minimum of y2  (Tichonov regularizer with data y2)

%visualization of the reconstruction

figure()
plot(X,F1,X,f1)
legend('Tichonov regularizer with y1','f1')
figure()
plot(X,F1,X,f2)
legend('Tichonov regularizer with y1','f2')
figure()
plot(X,F2,X,f1)
legend('Tichonov regularizer with y2','f1')
figure()
plot(X,F2,X,f2)
legend('Tichonov regularizer with y2','f2')


