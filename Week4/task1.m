clear all

Nens = 10;

%Simulation of process X

X0 = [0 0];

X = zeros(100,2);
X(1,:) = X0;
for k = 2:100
    
    r1 = randn();
    r2 = randn();
    X(k,:) = X0 + [r1 r2];

    X0 = X(k,:);

end

%Simulation of process Y

Y0 = [0 0];

Y = zeros(100,2);
Y(1,:) = Y0;
for k = 2:100

    q1 = randn();
    q2 = randn();

    Y(k,:) = Y0 + [q1+1/4*q2 q1-1/2*q2];

    Y0 = Y(k,:);
end

%drawing a Nens sample for bothe processes

X_ens = datasample(X,Nens);
X_ens = reshape(X_ens,[1,20]);
Y_ens = datasample(Y,Nens);
Y_ens = reshape(Y_ens,[1,20]);


subplot(1,2,1)
plot(X_ens)
title('Random process X')
subplot(1,2,2)
plot(Y_ens)
title('Random process Y')


%Nens = 10^5;

%Simulation of process X

X0 = [0 0];

X = zeros(17,2);
X(1,:) = X0;
for k = 2:17
    
    r1 = randn();
    r2 = randn();
    X(k,:) = X0 + [r1 r2];

    X0 = X(k,:);

end

%Simulation of process Y

Y0 = [0 0];

Y = zeros(17,2);
Y(1,:) = Y0;
for k = 2:17

    q1 = randn();
    q2 = randn();

    Y(k,:) = Y0 + [q1+1/4*q2 q1-1/2*q2];

    Y0 = Y(k,:);
end

C_X = cov(X(17,:));
C_Y = cov(Y(17,:));


