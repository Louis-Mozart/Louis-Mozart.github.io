function[ S , t ] = OrnsteinUhlenbeck( S0 , params , t, Nens )


S = zeros(length(t),1);
S(1,:) = S0;

dt = t(2)-t(1);

rng(1)
for i = 1:length(t)-1
   S(i+1) = S(i) + params(1) *(params(2) - S(i,:))*dt + params(3)*dt* randn();
end

t= t;
S = datasample(S,Nens);
end
