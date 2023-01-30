function[ S ] = GBM( S0 , params , t , Nens )

% params is a vector containing parameter mu and sigma
% the output S is the discretized solution of the geometric brownian motion
% using the Euler Maruyama algorithm

S = zeros(length(t),1);
S(1,:) = S0;

dt = (t(end)-t(1))/length(t);

for i = 1 : length( t ) -1
S( i + 1 ,: ) = S ( i , : ) + S(i,:) * (params(1) *dt + params(2)*dt^(.5)* randn(  ));
end

S = datasample(S,Nens);
end